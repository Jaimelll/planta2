ActiveAdmin.register_page "Epyg" do

  menu priority: 1, label: "EPyG"

  

  
    
   ##########################################################   
    
  
   content title: "Estado de Ganancias y Pérdidas (Resultados)" do
   
        vfac=Formula.where(product_id:2,unidad:3).select('factor')
        vact3=Formula.where(product_id:1,seccion:vfac).select('cantidad')
        vn='Estado de Ganancias y Pérdidas'
    


  
    columns do
       
  
         
        
                
           
                  columns do
                    
                    column  do  
                      
                      panel  "RESULTADOS" do   
                    
                    
                    table_for Formula.where(product_id:1,seccion:vfac).order('seccion,unidad')  do 
                     conta=0
                     veti2=""
                     contaa=0
                     vetii2=""
                     @vacums=0
                     vtimp=0
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
                      
                       
                       vimp= Situation.where(cta:formula.cantidad).sum('importe')*formula.factor
                       @vacums=@vacums+vimp
                        number_with_delimiter(vimp, delimiter: ",")       
                        end

                        column("Sub_total") do |formula|
                         
                          veti1=Formula.where(product_id:2,factor:formula.seccion).select('codigo as dd').first.dd
                         
                          unless veti2== veti1
                            veti2= veti1
                            conta=0
                          end  
                          conta=conta+1
                          if conta==1 then
                            vsecci=Formula.where(product_id:1,seccion:formula.seccion)
                            vcttas=vsecci.select('cantidad')
                            
                            vsecci.each do  |xcta|       
                             vtimp=vtimp+Situation.where(cta:xcta.cantidad).sum('importe')*xcta.factor
                            end 
                            div :class =>"grueso" do
                             
                              number_to_currency(vtimp, unit: "S/   ", separator: ".", delimiter: ",", precision: 2)
                            end
                          else
                            " "  
                          end
                          
                          end 
                      

                     







                      end
                     
                      
                      
                      vacumst=number_to_currency(@vacums, unit: "S/   ", separator: ".", delimiter: ",", precision: 2)
                      vspane=vn+' Total importe ='+vacumst
                      panel  vspane, :class => 'text-right' do  
                      end
                    end
                  end
                   
 

        end   #panel
  end# de column
  
  
  

end # content
end