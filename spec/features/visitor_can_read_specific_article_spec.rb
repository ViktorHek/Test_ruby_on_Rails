feature 'User can see specific article' do
    before do
        create(:article, title: 'A breaking news item', content: 'You can not belive what happend')
        create(:article, title: 'Some breaking action', content: 'This sh*t is cray-cray')

        visit root_path
        click_on 'A breaking news item'
    end

    context 'Article displays' do
        it 'title' do
            expect(page).to have_content 'A breaking news item'
        end

        it 'content' do 
            expect(page).to have_content 'You can not belive what happend'
        end
    end
end