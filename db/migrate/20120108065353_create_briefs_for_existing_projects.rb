class CreateBriefsForExistingProjects < ActiveRecord::Migration
  def up
    Project.all.each do |project|
      brief = project.build_brief
      brief.save!
      [Goals::BudgetItem, Goals::Feature, Goals::LabourInput, Goals::Yield].each do |klass|
        klass.update_all({:brief_id => brief.id}, {:project_id => project.id})
      end
    end
  end

  def down
    Project.all.each do |project|
      brief = project.brief
      if brief
        brief.save!
        [Goals::BudgetItem, Goals::Feature, Goals::LabourInput, Goals::Yield].each do |klass|
          klass.update_all({:project_id => project.id}, {:brief_id => brief.id})
        end
      end
    end
  end
end
