require 'pg'

feature 'Viewing bookmarks' do
  scenario 'seeing list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(4, 'http://www.bbc.co.uk');")

    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.bbc.co.uk'
  end
end
