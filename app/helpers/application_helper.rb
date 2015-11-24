module ApplicationHelper
  def words_form_helper(word)
    if word.nil? || word.new_record?
      @form = {   method: "post",
                  pass_id: "new",
                  css_class: "new-word",
                  button: "Add New Word!",
                  word: nil
               }
    else
      @form = {   method: "put",
                  pass_id: word.id,
                  css_class: "edit-word",
                  button: "Update #{word.text}",
                  word: word.text
              }
    end
    @form
  end

end