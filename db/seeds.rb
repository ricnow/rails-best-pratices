# frozen_string_literal: true

board = Board.create(name: 'Painel principal')

widget = PostsWidget.create(name: 'Posts recentes', board: board)
TasksWidget.create(name: 'Lista de Tarefas', board: board)
VideoWidget.create(name: 'Ao Vivo', board: board)

1.upto(100) do
  available_statuses = [1, 2, 3]

  Post.create(
    username: Faker::Name.name,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    status: available_statuses.sample,
    likes: rand(50),
    widget: widget
  )
end

1.upto(10) do
  Task.create(
    title: Faker::Lorem.sentence,
    task_type: %w[danger info warning success].sample,
    scheduled_to: DateTime.now,
    location: Faker::Address.full_address
  )
end
