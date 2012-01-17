class CreateSitesForExistingProjects < ActiveRecord::Migration
  def up
    Project.all.each do |project|
      Site.create!(:project_id => project.id)
    end
  end

  def down
    Site.destroy_all
  end
end
