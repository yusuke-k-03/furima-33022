require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録できるとき' do
    it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it '重複したemailが存在しなければ登録できる' do
      @user.save
      another_user = FactoryBot.build(:user)
      expect(another_user).to be_valid
    end

    it 'password,password_confirmationが６文字以上かつ半角英数字混合なら登録できる' do
      @user.password = "test11"
      @user.password_confirmation = "test11"
      expect(@user).to be_valid
    end

    it 'ユーザー本名は名字も名前も空でないかつ全角の漢字・ひらがな・カタカナであれば登録できる' do
      @user.last_name = "あ亞テスト"
      @user.first_name = "い伊テスト"
      expect(@user).to be_valid
    end

    it 'ユーザー本名のフリガナは名字も名前も空ではないかつ全角のカタカナであれば登録できる' do
      @user.last_name_kana = "テスト"
      @user.first_name_kana = "テスト"
      expect(@user).to be_valid
    end
  
  end

  context 'ユーザー新規登録できない時' do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "メールアドレスが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  

    it "emailは@を含めなければ登録できない" do
      @user.email = "2222aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは５文字以下では登録できない" do
      @user.password = "a1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordは半角英数字混合でなければ登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは全角英数混合では登録できない" do
      @user.password = "AAA１１１１"
      @user.password_confirmation = "AAA１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは確認用も含めて、２回入力しないと登録できない" do
      @user.password = "test11"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは確認用と値が一致しなければ登録できない" do
      @user.password = "test00"
      @user.password_confirmation = "test11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は名字が空でも登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名は名前が空でも登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名（名字）は全角の漢字・ひらがな・カタカナで入力されなければ登録できない" do
      @user.last_name = "1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "ユーザー本名（名前）は全角の漢字・ひらがな・カタカナで入力されなければ登録できない" do
      @user.first_name = "1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "ユーザー本名のフリガナは名字が空でも登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名のフリガナは名前が空でも登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナ（名字）は全角のカタカナで入力されなければ登録できない" do
      @user.last_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "ユーザー本名のフリガナ（名前）は全角のカタカナで入力されなければ登録できない" do
      @user.first_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "生年月日が空では登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

  end




end
