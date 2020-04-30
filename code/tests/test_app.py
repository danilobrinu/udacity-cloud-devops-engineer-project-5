# Local Packages
from capstone.app import create_app

app = create_app()


def test_index():
    with app.test_client() as client:
        res = client.get("/")

        assert res.status_code == 200
        assert res.mimetype == "application/json"
        assert res.json.get("message") == "Hello World!"


def test_world_stats():
    with app.test_client() as client:
        res = client.get("/world-stats")

        assert res.status_code == 200
        assert res.mimetype == "application/json"
        assert res.json.get("updatedAt") is not None