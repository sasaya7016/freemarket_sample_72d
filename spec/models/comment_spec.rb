require 'rails_helper'
describe Comment do
  describe '#create' do
    it "user_idとitem_idとmessageが存在すれば登録できること" do
      message = FactoryBot.build(:comment)
      expect(message).to be_valid
    end
    it "user_idがない時に登録できないこと" do
      comment = Comment.new(user_id: "",item_id: "1", message:"test")
      comment.valid?
      expect(comment.errors[:user_id]).to include("can't be blank")
    end
    it "item_idがない時に登録できないこと" do
      comment = Comment.new(user_id: "1",item_id: "", message:"test")
      comment.valid?
      expect(comment.errors[:item_id]).to include("can't be blank")
    end
    it "messageがない時に登録できないこと" do
      comment = Comment.new(user_id: "1",item_id: "1", message:"")
      comment.valid?
      expect(comment.errors[:message]).to include("can't be blank")
    end
    it "messageが36文字以上の時登録できないこと" do
      comment = FactoryBot.build(:comment, message:"ああああああああああああああああああああああああああああああああああああ")
      comment.valid?
      expect(comment.errors[:message]).to include("is too long (maximum is 35 characters)")
    end
    it "messageが35文字以内の時登録できること" do
      comment = FactoryBot.build(:comment, message:"あああああああああああああああああああああああああああああああああああ")
      expect(comment).to be_valid
    end
  end
end
