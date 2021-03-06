class EmsCloud < ExtManagementSystem
  has_many :availability_zones,            :foreign_key => :ems_id, :dependent => :destroy
  has_many :flavors,                       :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_tenants,                 :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_resource_quotas,         :foreign_key => :ems_id, :dependent => :destroy
  has_many :floating_ips,                  :foreign_key => :ems_id, :dependent => :destroy
  has_many :security_groups,               :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_networks,                :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_volumes,                 :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_volume_snapshots,        :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_object_store_containers, :foreign_key => :ems_id, :dependent => :destroy
  has_many :cloud_object_store_objects,    :foreign_key => :ems_id, :dependent => :destroy
  has_many :orchestration_stacks,          :foreign_key => :ems_id, :dependent => :destroy
  has_many :key_pairs,                     :class_name  => "AuthPrivateKey", :as => :resource, :dependent => :destroy

  # Development helper method for Rails console for opening a browser to the EMS.
  #
  # This method is NOT meant to be called from production code.
  def open_browser
    raise NotImplementedError unless Rails.env.development?
    require 'util/miq-system'
    MiqSystem.open_browser(browser_url)
  end
end
