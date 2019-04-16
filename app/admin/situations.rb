ActiveAdmin.register Situation do

      permit_params :cta, :cuenta,:detalle, :importe,:admin_user_id
     
      menu priority: 2, label: "SITUACION FINANCIERA"


      Formula.where(product_id:1).order('unidad').each do |situa|
        scope :"#{situa.codigo} ", :default => true do |situa2|
              Situation.where(cta:situa.cantidad)

         end
      end

      
      
      
      
         
     
      filter :cuenta
      filter :detalle
      filter :importe
      
      index :title => proc {"BUSCADOR"}   do
     
      
          
        column("cuenta")
        column("detalle")
        column("importe ", :class => 'text-right', sortable: :importe)  do |situa|
         if situa.importe then
           number_with_delimiter(situa.importe, delimiter: ",")
         else
           "s/d"
         end
        end

      
      actions
      end
      
      form :title => 'Edicion Cuentas' do |f|
      
          f.inputs  do
      
       f.input :cta , :input_html => { :style =>  'width:30%'}
       f.input :cuenta , :input_html => { :style =>  'width:30%'}
       f.input :detalle , :input_html => { :style =>  'width:30%'}
       f.input :importe ,:label => 'Descripcion del bien o servicio'
       f.input :admin_user_id, :input_html => { :value => current_admin_user.categoria }, :as => :hidden
     
        f.actions
      
      
      
      
          end #de inputs
      end #de form
      
      show :title => ' SITUACION'  do
      
          attributes_table  do
      
      
      
          
            row :cta
            row :cuenta
            row :detalle
            row :importe
           
            row "Modificado por" do |situa|
                  AdminUser.where(id:situa.admin_user_id).
                  select('email as dd').first.dd
            end 
      
        end #de attributes_table
      
      end # de show
      
      sidebar "Totales", only: :index  do
       
          vsac=Situation.ransack(params[:q]).result.sum(:importe)
          
          div :class =>"grueso" do
             li  "Importe Anual:  "+  number_to_currency(vsac, :unit => "S/ ",:precision=> 0)
       
          end 
    
              
        end
        
      
           
      
      end
      