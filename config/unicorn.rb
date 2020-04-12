app_path = File.expand_path('../../../', __FILE__)
# アプリケーションサーバーの性能設定
worker_processes 1
# アプリケーションの設置されているディレクトリ　→　なぜか今はfreemarket_sample_72d以下のcurrentに設置
working_directory "#{app_path}/releases/current"
#Unicornの起動に必要なファイルの設置場所指定
pid "#{app_path}/shared/tmp/pids/unicorn.pid"
#unicornのポート設定
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"
#エラーログ記録
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
#通常ログ記録
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

timeout 60

preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end