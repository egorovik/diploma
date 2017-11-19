module DocumentsHelper
  def link_to_add_document(form, person)
    new_object = Document.new()
    fields = form.fields_for(:documents, new_object, 
      :child_index => 'new_document') do |builder|
      render('students/add_document', fn: builder)
    end
    link_to(?#, class: 'btn btn-info', 
        id: 'add_document_link', data: {content: "#{fields}"}) do 
      " Новый документ" 
    end
  end
  
  def link_to_remove_document(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_document') do 
      ' Удалить'      
    end
  end
end
