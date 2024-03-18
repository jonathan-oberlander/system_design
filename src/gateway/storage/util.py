from gridfs import GridFS
import pika
import json


def upload(file, fs: GridFS, channel, access):
    try:
        fid = fs.put(file)
    except Exception as err:
        return "internal server error", 500

    message = {"video_fid": str(fid), "mp3_fid": None, "username": access["username"]}

    try:
        channel.basic_publish(
            exchange="",
            routing_key="video",
            body=json.dumps(message),  # serialises a python object to a json
            properties=pika.BasicProperties(
                delivery_mode=pika.spec.PERSISTENT_DELIVERY_MODE  # perist in case pod rest or fails
            ),
        )
    except:
        fs.delete(fid)
        return "internal server error", 500
