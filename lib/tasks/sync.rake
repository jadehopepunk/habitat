namespace :sync do
  def echo_and_run(command)
    puts command
    system command
  end
  
  desc "Copy the production database into this local installation"
  task :production => [:environment] do
    db_host = "lucid.craigambrose.com"
    db_config = YAML.load_file('config/database.yml')
    dev_config = db_config['development']
    prod_config = db_config['production']
    mysql_params = "-u #{dev_config["username"]}"
    mysql_params += " -h #{dev_config["host"]}" if dev_config["host"]
    mysql_params += " -p#{dev_config["password"]}" if dev_config["password"]
    mysql_params += " #{dev_config["database"]}"
    
    echo_and_run "ssh #{db_host} \"mysqldump -u #{prod_config["username"]} -p#{prod_config["password"] } -Q --add-drop-table -O add-locks=FALSE -O lock-tables=FALSE #{prod_config["database"]} > ~/habitat_dump.sql\""
    echo_and_run "rsync -az --progress craig@#{db_host}:~/habitat_dump.sql ./tmp/production_data.sql"
    echo_and_run "rsync -az --progress craig@#{db_host}:~/sites/habitat/shared/system/* ./public/system/"
    echo_and_run "mysql #{mysql_params} < ./tmp/production_data.sql"
  end
end
