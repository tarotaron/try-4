class SearchController < ApplicationController
  def search
  	@content = params["content"]
  	@model = params["model"]
  	@how = params["how"]
  	@datas = search_for(@how,@model,@content)
  end

  private
  def match(model,content)
    if model == 'user'
    User.where(name: content)
  else model == 'book'
    Book.where(title: content)
  end
  end

  def forward(model,content)
    if model == 'user'
    User.where("name LIKE?","#{content}%")
  else model == 'book'
    Book.where("title LIKE?","#{content}%")
  end
  end

  def backward(model,content)
    if model == 'user'
    User.where("name LIKE?","%#{content}")
  else model == 'book'
    Book.where("title LIKE?","%#{content}")
  end
  end

  def partical(model,content)
    if model == 'user'
    User.where("name LIKE?","%#{content}%")
  else model == 'book'
    Book.where("title LIKE?","%#{content}%")
  end
  end

  def search_for(how,model,content)
    case how
    when'match'
  		match(model,content)
  	when'forward'
  		forward(model,content)
  	when'backward'
  		backward(model,content)
  	when'partical'
  		partical(model,content)
  	end
  end
end
