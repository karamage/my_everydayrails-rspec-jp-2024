require 'rails_helper'

RSpec.describe Note, type: :model do

  before do
    # このファイルの全テストで使用するテストデータをセットアップする
    @user = User.create(
      first_name:  "Joe",
      last_name:  "Tester",
      email:      "joetester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
      )

    @project = @user.projects.create(
      name: "Test Project",
    )
  end

  # バリデーション用のスペックが並ぶ

  # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
  it "is valid with a user, project, and message" do
    note = Note.new(
      message: "This is a sample note,",
      user: @user,
      project: @project,
    )
    expect(note).to be_valid
  end

  # 文字列に一致するメッセージを検索する
  describe "search message for a term" do

    before do
      # 検索機能の全テストに関連する追加のテストデータをセットアップする
    end
    # 一致するデータが見つかるとき
    context "when a match is found" do
      # 一致する場合の example が並ぶ
    end

    # 一致するデータが1件も見つからないとき
    context "when no match is found" do
      # 一致しない場合の example が並ぶ
    end

  end

end

=begin
# 検索結果を検証するスペック
# 検索結果が１件も見つからなければカラのコレクションを返すこと
it "returns an empty collection when no results are found" do
  user = User.create(
    first_name:  "Joe",
    last_name:  "Tester",
    email:      "joetester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
    )

  project = user.projects.create(
    name: "Test Project",
  )

  note1 = project.notes.create(
    message: "This is the first note.",
    user: user,
  )
  note2 = project.notes.create(
    message: "This is the second note.",
    user: user,
  )
  note3 = project.notes.create(
    message: "First, preheat the oven.",
    user: user,
  )

  expect(Note.search("message")).to be_empty
end

# 検索文字列に一致するメモを返すこと
it "returns notes that match the search term" do
  user = User.create(
    first_name:  "Joe",
    last_name:  "Tester",
    email:      "joetester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
    )

  project = user.projects.create(
    name: "Test Project",
    )

  note1 = project.notes.create(
    message: "This is the first note.",
    user: user,
    )
  note2 = project.notes.create(
    message: "This is the second note.",
    user: user,
    )
  note3 = project.notes.create(
    message: "First, preheat the oven.",
    user: user,
    )

  expect(Note.search("first")).to include(note1, note3)
  expect(Note.search("first")).to_not include(note2)
end
=end
