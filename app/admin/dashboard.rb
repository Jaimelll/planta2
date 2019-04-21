ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "INICIO"

  

  
    content title: "SITUACION FINANCIERA" do
       
    
      columns do
          column max_width: "2000px", min_width: "1200px"  do
    
           
           panel  "I.-ESTADO DE SITUACION FINANCIERA" do
                  
             
                    columns do
                      
                      column  do     
                      vact=Formula.where(product_id:2,unidad:1).select('factor')
                      table_for Formula.where(product_id:1,seccion:vact).order('unidad')  do 
                        column("Activo") do |formula|
                       
                          Formula.where(product_id:2,factor:formula.seccion).select('codigo as dd').first.dd
                                 
                          end 
                      
                       column("Activo") do |formula|
                       
                        formula.codigo.capitalize
                               
                        end
                        column("Importe", :class => 'text-right') do |formula|
                        
                       
                         vimp= Situation.where(cta:formula.cantidad).sum('importe')
                          number_with_delimiter(vimp, delimiter: ",")       
                          end


                        
                      end
                    end

                    column  do     
                      vact=Formula.where(product_id:2,unidad:2).select('factor')
                      table_for Formula.where(product_id:1,seccion:vact).order('unidad')  do 
                        column("Pasivo") do |formula|
                       
                          Formula.where(product_id:2,factor:formula.seccion).select('codigo as dd').first.dd
                                 
                          end 
                      
                       column("Pasivo") do |formula|
                       
                        formula.codigo.capitalize
                               
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
    
    #####################2
    
    column do
    panel  "II.-ESTADO DE GANANCIAS Y PERDIDAS (RESULTADOS)" do
      table_for Formula.where(product_id:1,seccion:100).order('unidad')  do 
    
      
    
    
  
    

      
       column("CUENTA") do |formula|
       
        formula.codigo.capitalize
               
        end
        column("Importe", :class => 'text-right') do |formula|
        
       
         vimp= Situation.where(cta:formula.cantidad).sum('importe')
          number_with_delimiter(vimp, delimiter: ",")       
          end

             
   
    
    
       end#panel
    
        
     end   #table fo
    end
   
    
  end
  end # content
end
