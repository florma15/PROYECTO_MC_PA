
from app import app

from routers.router_login import *
from routers.router_home import *
from routers.router_page_not_found import *



if __name__ == '__main__':
    app.run(debug=True, port=5600)
