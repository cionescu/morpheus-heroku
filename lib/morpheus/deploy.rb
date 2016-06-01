module Morpheus
  module Deploy
    extend self

    def production
      ensure_local_remote_is_up_to_date!
      deploy_to_heroku!
      run_database_migrations!
      tag_release!
      update_git!
    end

    private

    def git_branch
      @branch ||= `git branch | grep -e "^*"`.strip.gsub("* ", "")
    end

    def ensure_local_remote_is_up_to_date!
      Helper.bash_run(command: "git pull origin #{git_branch}")
    end

    def deploy_to_heroku!
      Helper.bash_run(command: "git push heroku #{git_branch}:master --force")
    end

    def run_database_migrations!
      Helper.heroku_run(command: "heroku run rake db:migrate")
    end

    def tag_release!
      Helper.bash_run(command: "git tag #{tag_name}")
    end

    def tag_name
      "heroku_deploy_#{Time.now.to_s(:db).gsub(/[- :]/, "_")}"
    end

    def update_git!
      Helper.bash_run(command: "git push origin #{git_branch}")
    end
  end
end
