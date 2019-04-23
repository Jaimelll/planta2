
ActiveAdmin.register_page "grafico" do

  menu  priority: 4,label: "Grafico Cuentas"


action_item :only=> :index do
    link_to 'Activo', activo_admin_product_formula_path(1, :@num), method: :put

end

action_item :only=> :index do
    link_to 'Pasivo', pasivo_admin_product_formula_path(1, :@num), method: :put

end


action_item :only=> :index do
    link_to 'Resultado', resultado_admin_product_formula_path(1, :@num), method: :put

end



  
  content title: "SITUACION FINANCIERA" do
   
     


    vestd=Formula.where(product_id:3,unidad:1).select('cantidad as dd').first.dd
    @vtit=Formula.where(product_id:3,unidad:1).select('codigo as dd').first.dd
    vestdet=Formula.where(product_id:2,unidad:vestd).select('factor')

    
    @vcuenta=[]
    @vimporte=[]

    Formula.where(product_id:1,seccion:vestdet).order('unidad').each do |situa|
      @vcuenta.push(situa.codigo)
      @vimporte.push(Situation.where(cta:situa.cantidad).sum('importe'))
     end



    
               render :partial => "grafico",
               :locals => { :param1 => @vcuenta,
                            :param2 => @vimporte,
 
                            :param20 =>  @vtit}


  end


end
