ActiveAdmin.register Situation do

      permit_params :cta, :cuenta,:detalle, :importe,:admin_user_id
     
     # menu priority: 2, label: "CUENTAS"
     menu false


   

      Formula.where(product_id:1).order('unidad').each do |situa|
        
        scope :"#{situa.cantidad.to_i.to_s}", :default => true do |situa2|

              Situation.where(cta:situa.cantidad)

         end
      end

      def scop1(var)
        if var then
          Formula.where(cantidad:var).select('codigo as dd').first.dd
        else
          Formula.where(cantidad:60).select('codigo as dd').first.dd
        end  
      end  

   
      
      
      
         
     
      filter :cuenta
      filter :detalle
      filter :importe


     
 
        index :title => proc {"Situación Financiera al 31 de diciembre del 2018-Cuentas"}   do
        # index title:scop1(params[:scope]) do
        def scop2(var)
          if var then
            Situation.where(cta:var).sum('importe')
          else
            Situation.where(cta:60).sum('importe')
          end  
        end    
          
        column("cuenta")
        column("detalle")
        column("importe ", :class => 'text-right', sortable: :importe)  do |situa|
         if situa.importe then
           number_with_delimiter(situa.importe, delimiter: ",")
         else
           "s/d"
         end
        end
        column("importe mes ", :class => 'text-right', sortable: :importe)  do |situa|
          if situa.importe then
           vimes=(situa.importe/12*100).to_i.to_f/100
             number_with_delimiter(vimes, delimiter: ",")
          else
            "s/d"
          end
         end
         
         column("%", :class => 'text-right', sortable: :importe)  do |situa|
          if situa.importe then
          vpor=situa.importe/scop2(params[:scope])*100
           vpor.to_i
          else
            "s/d"
          end
         end

         
         if current_admin_user.id==1 then
            actions
         end
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
      
      
      
          
            
            row :cuenta
            row :detalle
            row :importe
           
            row "Modificado por" do |situa|
                  AdminUser.where(id:situa.admin_user_id).
                  select('email as dd').first.dd
            end 
      
        end #de attributes_table
      
      end # de show
      
      def scop1(var)
        if var then
          Formula.where(cantidad:var).select('codigo as dd').first.dd
        else
          Formula.where(cantidad:60).select('codigo as dd').first.dd
        end  
      end  
    

      sidebar "CUENTA" do
        def scop1(var)
          if var then
         li   Formula.where(cantidad:var).select('codigo as dd').first.dd
         li   "IMPORTE= "+number_with_delimiter(Situation.where(cta:var).sum('importe')), delimiter: ","
         
          else
         li   Formula.where(cantidad:60).select('codigo as dd').first.dd
         li   number_with_delimiter(Situation.where(cta:60).sum('importe')), delimiter: ","
          end  
        end  

        div :class =>"grueso" do
           scop1(params[:scope])

        end

    end # de sider
        
      
     
      
      end
      