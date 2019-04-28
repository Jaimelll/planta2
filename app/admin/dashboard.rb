ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "EEFF"

  

  
    content title: "Estados Financieros" do
      vaf=current_admin_user.periodo
      case vaf
        when 1
          vfac=[1,2,3,10,11,12,24,100] 
        when 2  
         vfac=[1,12]  
      end


    
      columns do
         
    
           
          
                  
             
                    columns do
                      
                      column  do  
                        
                        panel  "ACTIVO" do   
                      vact=Formula.where(product_id:2,unidad:1,factor:vfac).select('factor')
                      
                      table_for Formula.where(product_id:1,seccion:vact).order('unidad')  do 
                       conta=0
                       veti2=""
                        column("Origen") do |formula|
                           
                          veti1=Formula.where(product_id:2,factor:formula.seccion).select('codigo as dd').first.dd
                          unless veti2== veti1
                            veti2= veti1
                            conta=0
                          end  
                          conta=conta+1
                          if conta==1 then
                            veti1
                          else
                            " "  
                          end
                          
                          end 
                      
                       column("Cuenta") do |formula|
                       
                        vscop=formula.cantidad.to_i
                        link_to formula.codigo.capitalize, admin_situations_path(scope:vscop)
                               
                        end
                        column("Importe", :class => 'text-right') do |formula|
                        
                       
                         vimp= Situation.where(cta:formula.cantidad).sum('importe')
                          number_with_delimiter(vimp, delimiter: ",")       
                          end

                        end
                        
                      end
                    end
                     
                    column  do  
                      panel  "PASIVO" do   
                      vact=Formula.where(product_id:2,unidad:2,factor:vfac).select('factor')
                      table_for Formula.where(product_id:1,seccion:vact).order('unidad')  do 
                        conta=0
                        veti2=""
                         column("Origen") do |formula|
                            
                           veti1=Formula.where(product_id:2,factor:formula.seccion).select('codigo as dd').first.dd
                           unless veti2== veti1
                             veti2= veti1
                             conta=0
                           end  
                           conta=conta+1
                           if conta==1 then
                             veti1
                           else
                             " "  
                           end
                           
                           end 
 
                      
                       column("Cuenta") do |formula|
                        vscop=formula.cantidad.to_i
                        link_to formula.codigo.capitalize, admin_situations_path(scope:vscop)
                               
                        end
                        column("Importe", :class => 'text-right') do |formula|
                        
                       
                         vimp= Situation.where(cta:formula.cantidad).sum('importe')
                          number_with_delimiter(vimp, delimiter: ",")       
                          end


                        
                      end
                    
                   
                    end
    
                     end#columns
  
          end   #panel
    end# de column
    
    
    
  
  end # content
end
