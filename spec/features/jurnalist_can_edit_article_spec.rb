feature 'jurnalist can' do
    context 'edit an article' do 
        let(:article) {create(:article, title: 'Some crispy news', content: 'This is very bad content') }

        before do
            visit root_path
            click_on 'Login'
            fill_in "Email", with: 'admin@example.com'
            fill_in "Password", with: 'password'
            click_on 'Log in'
            visit article_path(article)
            click_on 'Edit Article'
        end

        it 'to change the content' do
            fill_in 'Content', with: 'did u know jesus is king'
            click_on 'Update Article'
            expect(page).to have_content 'did u know jesus is king'
        end
    end    
end