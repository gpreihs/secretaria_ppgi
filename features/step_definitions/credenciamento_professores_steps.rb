require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Dado "que existam as seguintes solicitações:" do |table|
    pending
    # table.hashes.each do |row|
    # end
end

Dado "que existam os seguintes credenciamentos sem prazo definido:" do |table|
    pending
    # table.hashes.each do |row|
    # end
end

Dado /^que eu esteja cadastrado e logado como (.*)$/ do |input|
    user_props = [:full_name, :email, :password, :role, :registration]
    
    values = input.gsub!(/"/,'').split(/,\s?/)
    record = Hash[user_props.zip(values)]
    User.create!(record)
    
    steps %(
        Dado que eu esteja logado como "#{record[:email]}", "#{record[:password]}"
    )
end

Dado /^que eu esteja logado como (.*)$/ do |input|
    fields = ['email', 'password']
    values = Hash[fields.zip input.gsub!(/"/,'').split(/,\s?/)]

    visit new_user_session_path
    fill_in("Email", :with => values['email'])
    fill_in("Password", :with => values['password'])
    click_button("Log in")
end

Dado /^que eu esteja na página (.+)$/ do |page_name|
    visit path_to(page_name)
end

Quando /^eu anexo o arquivo "([^"]*)" em '([^']*)'$/ do |path, field|
    attach_file(field, File.expand_path(path))
end

Quando /^eu clico em '([^']*)'$/ do |link|
    click_link(link)
end

Então /^eu devo estar na página (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end

Quando /^eu marco os seguintes estados (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        check("statuses[#{status}]")
    end
end

Quando /^eu desmarco os seguintes estados (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        uncheck("statuses[#{status}]")
    end
end

Quando /^eu preencho em '([^']*)' com/m do |field, text|
    fill_in(field, :with => text)
end

Quando /^eu preencho com "([^"]*)" em '([^']*)'$/ do |text, field|
    fill_in(field, :with => text)
end

Quando /^eu seleciono uma data posterior a atual em '([^']*)'$/ do |field|
    pending
    # select_date(date, :from => field)
end

Quando /^eu seleciono uma data anterior a atual em '([^']*)'$/ do |field|
    pending
    # select_date(date, :from => field)
end

Quando /^eu aperto '([^']*)'$/ do |button|
    click_button(button)
end

Então /^eu devo ver "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end

Então /^eu não devo ver "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_no_content(text)
    else
        assert page.has_no_content?(text)
    end
end

Então /^eu recebo uma mensagem de (sucesso|erro)$/ do |status|
    if(status == 'sucesso') 
        find(".notice", text: /sucesso!$/)
    elsif(status == 'erro')
        find("#error_explanation")
    else
        raise StandardError.new('Mensagem não encontrada')
    end
end
