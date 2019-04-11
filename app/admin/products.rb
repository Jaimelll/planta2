ActiveAdmin.register Product do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # permit_params :list, :of, :attributes, :on, :model
    #
    # or
    #
    # permit_params do
    #   permitted = [:permitted, :attributes]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
    #menu if: proc{ current_admin_user.categoria==2 }, priority: 3, label: "Productos"
    
   
    
    
    permit_params :nombre, :descripcion, :orden
         
    
    menu  priority: 30, label: "Productos"
    
    
    
 
    
    filter :nombre
    
    
    
    index do
      column("nombre") 
    
      column("descripcion")
      column("orden")
    
    
        actions
    end
    
    
    
    form do |f|
    
      f.inputs "Products" do
            f.input :nombre
            f.input :descripcion
            f.input :orden
    f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, :as => :hidden
      end
    
    
    
         f.actions
    
    end
    
    
    show do
    
    
              attributes_table do
    
    
    
                row :nombre
                row :descripcion
                row :orden
                row :admin_user_id
              end
    
          end
    
    
    
    
    end
    