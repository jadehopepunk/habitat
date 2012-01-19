class CreateSitesForExistingProjects < ActiveRecord::Migration
  def up
    Project.all.each do |project|
      execute "INSERT INTO sites (id, project_id) VALUES (#{project.id}, #{project.id})"
    end
  end

  def down
    Site.destroy_all
  end
end
