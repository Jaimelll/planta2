ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "EEFF"

  action_item :only=> :index do
    $vaf=current_admin_user.periodo
      link_to  'E P y G', af_admin_admin_user_path(1), method: :put
  end
  
  action_item :only=> :index do
    $vaf=current_admin_user.periodo
      link_to  'Liquidez', liq_admin_admin_user_path(1), method: :put
  end
  


  

  
    content title: "Estados Financieros" do
      vaf=current_admin_user.periodo
      case vaf
        when 1
          vfac=[1,2,3,10,11,12,24,100] 
          vn='Estado de Situación Financiera'
        when 2  
         vfac=[1,12]  
         vn='Liquidez'
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
                        vact2=Formula.where(product_id:2,unidad:1,factor:vfac).select('factor')
                        vact3=Formula.where(product_id:1,seccion:vact2).select('cantidad')
                        vsta=number_with_delimiter(Situation.where(cta:vact3).sum('importe'), delimiter: ",").to_s
                         
                        vspane=vn+' Total importe Activo ='+vsta
                        panel  vspane, :class => 'text-right' do  
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
                      vact2=Formula.where(product_id:2,unidad:2,factor:vfac).select('factor')
                      vact3=Formula.where(product_id:1,seccion:vact2).select('cantidad')
                      vsta=number_with_delimiter(Situation.where(cta:vact3).sum('importe'), delimiter: ",").to_s
                       
                      vspane=vn+' Total importe Pasivo ='+vsta
                      panel  vspane, :class => 'text-right' do  
                      end                    
                   
                    end
    
                     end#columns
  
          end   #panel
    end# de column
    
    
    
  
  end # content
end
