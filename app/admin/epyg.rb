ActiveAdmin.register_page "Epyg" do

  menu priority: 1, label: "EPyG"

  

  
    content title: "Estado de Ganancias y Pérdidas (Resultados)" do
       
    
      columns do
         
    
           
          
    
    column do
    panel  "II.-ESTADO DE GANANCIAS Y PERDIDAS (RESULTADOS)" do
      table_for Formula.where(product_id:1,seccion:100).order('unidad')  do 
    
      
    
    
  
    

      
       column("CUENTA") do |formula|
       
       
        vscop=formula.cantidad.to_i
        link_to formula.codigo.capitalize, admin_situations_path(scope:vscop)               
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
