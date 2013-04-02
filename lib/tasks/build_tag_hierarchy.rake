
















def find_tag_or_create(tag_name)
  tag = Tag.where(:name => tag_name).first
  puts "tag #{tag.inspect}"
  unless tag 
    tag = Tag.new(:name => tag_name)
    tag.save
  end
  tag
end

def set_parent(child_name, parent_name)
  child = find_tag_or_create(child_name)
  parent = find_tag_or_create(parent_name)
  puts "setting #{parent_name} as dad of #{child_name} \nchild #{child.inspect} \nparent #{parent.inspect}\n\n"
  child.set_parent! parent
end

def set_up_tags
  set_parent('Devon', 'England')  
  rels = [{'England' => ['Cornwall', 'Dorset', 'Devon', 'Wiltshire', 
                         'Lancashire', 'Greater Manchester']},
          {'Greater Manchester' => ['City Centre', 'Salford Quays']},
          {'Scotland' => ['Glen Coe', 'Isle of Skye']},
          {'Wales' => ['Glamorgan', 'Breacon Beacons']},
          {'Italy' => ['Venice']},
          {'Nature' => ['Birds','Insects','Deer']},
          {'Insects' => ['Odonata']},
          {'Odonata' => ['Dragonflies', 'Damselflies']}]

  rels.each do |rel|
   rel.each do |parent, children| # only one rel
      children.each do |child|
        puts 'will set ' + parent + ' as parent of ' + child
        set_parent child, parent
      end
    end
    
  end
end


namespace :tag_hierarchy do
  desc 'Set up tag hierarchy'
  task :set_up_tags => :environment do
    set_up_tags
  end
end
