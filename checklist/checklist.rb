ActiveRecord::Schema[7.0].define(version: 2022_12_28_065556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "data_dumps", id: :serial, force: :cascade do |t|
    t.text "data"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "doc_assignments", id: :serial, force: :cascade do |t|
    t.integer "repo_id"
    t.integer "repo_subscription_id"
    t.integer "doc_method_id"
    t.integer "doc_class_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "clicked", default: false
    t.index ["repo_id"], name: "index_doc_assignments_on_repo_id"
    t.index ["repo_subscription_id", "doc_method_id"], name: "index_doc_assignments_on_repo_subscription_id_and_doc_method_id"
  end

  create_table "doc_classes", id: :serial, force: :cascade do |t|
    t.integer "repo_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "doc_comments_count", default: 0, null: false
    t.integer "line"
    t.string "path"
    t.string "file"
    t.index ["repo_id", "doc_comments_count"], name: "index_doc_classes_on_repo_id_and_doc_comments_count"
  end

  create_table "doc_comments", id: :serial, force: :cascade do |t|
    t.integer "doc_class_id"
    t.integer "doc_method_id"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["doc_class_id"], name: "index_doc_comments_on_doc_class_id"
    t.index ["doc_method_id"], name: "index_doc_comments_on_doc_method_id"
  end

  create_table "doc_methods", id: :serial, force: :cascade do |t|
    t.integer "repo_id"
    t.string "name"
    t.integer "line"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "doc_comments_count", default: 0, null: false
    t.string "path"
    t.string "file"
    t.boolean "skip_write", default: false
    t.boolean "active", default: true
    t.boolean "skip_read", default: false
    t.boolean "has_comment"
    t.text "comment"
    t.index ["repo_id", "doc_comments_count"], name: "index_doc_methods_on_repo_id_and_doc_comments_count"
    t.index ["repo_id", "id"], name: "index_doc_methods_on_repo_id_and_id"
    t.index ["repo_id", "name", "path"], name: "index_doc_methods_on_repo_id_and_name_and_path", unique: true
  end

  create_table "issue_assignments", id: :serial, force: :cascade do |t|
    t.integer "issue_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "repo_subscription_id"
    t.boolean "clicked", default: false
    t.boolean "delivered", default: false
    t.index ["repo_subscription_id", "delivered"], name: "index_issue_assignments_on_repo_subscription_id_and_delivered"
  end

  create_table "issues", id: :serial, force: :cascade do |t|
    t.integer "comment_count"
    t.string "url"
    t.string "repo_name"
    t.string "user_name"
    t.datetime "last_touched_at", precision: nil
    t.integer "number"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "repo_id"
    t.text "title"
    t.string "html_url"
    t.string "state"
    t.boolean "pr_attached", default: false
    t.index ["number", "repo_id"], name: "index_issues_on_number_and_repo_id", unique: true
    t.index ["repo_id", "id"], name: "index_issues_on_repo_id_and_id", where: "((state)::text = 'open'::text)"
    t.index ["repo_id", "number"], name: "index_issues_on_repo_id_and_number"
    t.index ["repo_id", "state"], name: "index_issues_on_repo_id_and_state"
    t.index ["updated_at"], name: "index_issues_on_updated_at", where: "((state)::text = 'open'::text)"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repo_labels", force: :cascade do |t|
    t.bigint "repo_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_repo_labels_on_label_id"
    t.index ["repo_id", "label_id"], name: "index_repo_labels_on_repo_id_and_label_id", unique: true
    t.index ["repo_id"], name: "index_repo_labels_on_repo_id"
  end

  create_table "repo_subscriptions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "repo_id"
    t.datetime "last_sent_at", precision: nil
    t.integer "email_limit", default: 1
    t.boolean "write", default: false
    t.boolean "read", default: false
    t.integer "write_limit"
    t.integer "read_limit"
    t.index ["read"], name: "index_repo_subscriptions_on_read"
    t.index ["repo_id", "user_id"], name: "index_repo_subscriptions_on_repo_id_and_user_id"
    t.index ["repo_id"], name: "index_repo_subscriptions_on_repo_id"
    t.index ["user_id", "last_sent_at"], name: "index_repo_subscriptions_on_user_id_and_last_sent_at"
    t.index ["write"], name: "index_repo_subscriptions_on_write"
  end

  create_table "repos", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "user_name"
    t.integer "issues_count", default: 0, null: false
    t.string "language"
    t.string "description"
    t.string "full_name"
    t.text "notes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "github_error_msg"
    t.string "commit_sha"
    t.integer "stars_count", default: 0
    t.integer "subscribers_count", default: 0
    t.integer "docs_subscriber_count", default: 0
    t.boolean "removed_from_github", default: false
    t.boolean "archived", default: false
    t.index ["archived"], name: "index_repos_on_archived"
    t.index ["full_name"], name: "index_repos_on_full_name"
    t.index ["issues_count"], name: "index_repos_on_issues_count"
    t.index ["language"], name: "index_repos_on_language"
    t.index ["name", "user_name"], name: "index_repos_on_name_and_user_name", unique: true
    t.index ["subscribers_count"], name: "index_repos_on_subscribers_count"
    t.index ["user_name"], name: "index_repos_on_user_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "zip"
    t.string "phone_number"
    t.boolean "twitter"
    t.string "github"
    t.string "github_access_token"
    t.boolean "admin"
    t.string "avatar_url", default: "http://gravatar.com/avatar/default"
    t.string "name"
    t.boolean "private", default: false
    t.string "favorite_languages", array: true
    t.integer "daily_issue_limit", default: 50
    t.boolean "skip_issues_with_pr", default: false
    t.string "account_delete_token"
    t.datetime "last_clicked_at", precision: nil
    t.string "email_frequency", default: "daily"
    t.time "email_time_of_day"
    t.string "old_token"
    t.integer "raw_streak_count", default: 0
    t.integer "raw_emails_since_click", default: 0
    t.datetime "last_email_at", precision: nil
    t.boolean "htos_contributor_unsubscribe", default: false, null: false
    t.boolean "htos_contributor_bought", default: false, null: false
    t.index ["account_delete_token"], name: "index_users_on_account_delete_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["github"], name: "index_users_on_github", unique: true
    t.index ["github_access_token"], name: "index_users_on_github_access_token"
    t.index ["private", "id", "created_at"], name: "index_users_on_private_and_id_and_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
# frozen_string_literal: true

require "sidekiq/web"

CodeTriage::Application.routes.draw do
  sitemap_url = File.join("https://#{ENV["BUCKETEER_BUCKET_NAME"]}.s3.amazonaws.com/", "sitemaps", "sitemap.xml.gz")
  get "sitemap.xml.gz", to: redirect(sitemap_url)

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end
  resources :doc_methods, only: [:show]

  resources :university, only: [:show, :index]
  get "example_app" => "university#show", :id => "example_app"
  get "reproduction" => "university#show", :id => "reproduction"
  get "repro" => "university#show", :id => "reproduction"
  get "squash" => "university#show", :id => "squash"
  get "rebase" => "university#show", :id => "rebase"

  devise_for :users, skip: [:registration],
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  as :user do
    get "users/edit" => "users#edit", :as => :edit_user_registration
    patch "users" => "users#update", :as => :user_registration
  end

  root to: "pages#index"
  resources :topics, only: [:show]

  get "what" => "pages#what"
  get "privacy" => "pages#privacy"
  get "support" => "pages#support"

  namespace :users do
    resources :after_signup, only: [:show, :update]
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  get "/users/unsubscribe/:account_delete_token" => "users#token_delete", :as => :token_delete_user
  delete "/users/unsubscribe/:account_delete_token" => "users#token_destroy"

  resources :issue_assignments, only: [:create]

  get "/issue_assignments/:id/users/:user_id/click", to: "issue_assignments#click_issue_redirect", as: :issue_click
  get "/doc_methods/:id/users/:user_id/click", to: "doc_methods#click_method_redirect", as: :doc_method_click
  get "/doc_methods/:id/users/:user_id/source_click", to: "doc_methods#click_source_redirect", as: :doc_source_click

  resources :repo_subscriptions, only: [:create, :destroy, :update]

  get "mail_view", to: redirect("rails/mailers")

  # format: false gives us rails 3.0 style routes so angular/angular.js is interpreted as
  # user_name: "angular", name: "angular.js" instead of using the "js" as a format
  scope format: false do
    resources :repos, only: [:index, :new, :create] do
      collection do
        get :list
      end
    end

    scope "*full_name" do
      constraints full_name: /[-_a-zA-Z0-9]+\/[-_\.a-zA-Z0-9]+/ do
        get "/badges/:badge_type(.:format)", to: "badges#show", as: "badge"
        get "info(.:format)", to: "api_info#show"

        get "/", to: "repos#show", as: "repo"
        patch "/", to: "repos#update", as: nil
        get "/edit", to: "repos#edit", as: "edit_repo"
        get "/subscribers", to: "subscribers#show", as: "repo_subscribers"
      end
    end
  end
end
  add_foreign_key "repo_labels", "labels"
  add_foreign_key "repo_labels", "repos"
  add_foreign_key "repo_subscriptions", "repos"
  add_foreign_key "repo_subscriptions", "users"
end
