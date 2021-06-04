import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class MultipleImagePicker extends StatefulWidget {
  MultipleImagePicker(this.imagePickFn);

  final void Function(File pickedImage, File pickedVideo) imagePickFn;

  @override
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  List images = [];
  File _imageFile;
  File _videoFile;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    setState(() {
      images.add("Add Image");
      images.add("Add Video");
      // images.add("Add Image");
      // images.add("Add Image");
    });
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildGridView();
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                if (uploadModel.type == "video")
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                else
                  Image.file(
                    uploadModel.imageFile,
                    width: 300,
                    height: 300,
                  ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      if (_controller != null) _controller.pause();

                      if (uploadModel.type == "image")
                        _imageFile = null;
                      else if (uploadModel.type == "video") _videoFile = null;

                      widget.imagePickFn(_imageFile, _videoFile);
                      setState(() {
                        if (uploadModel.type == "image")
                          images.replaceRange(index, index + 1, ['Add Image']);
                        else if (uploadModel.type == "video")
                          images.replaceRange(index, index + 1, ['Add Video']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          if (images[index] == "Add Image")
            return Card(
              child: TextButton(
                //style: ButtonStyle(backgroundColor: ),
                child: Text("Thêm ảnh"),
                onPressed: () {
                  _onAddImageClick(index);
                },
              ),
            );
          else if (images[index] == "Add Video")
            return Card(
              child: TextButton(
                //style: ButtonStyle(backgroundColor: ),
                child: Text("Thêm video"),
                onPressed: () {
                  _onAddImageClick(index);
                },
              ),
            );
          else
            return Container();
        }
      }),
    );
  }

  Future<void> _onAddImageClick(int index) async {
    if (images[index] == "Add Image") {
      final pickedImageFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedImageFile == null) return;
      setState(() {
        _imageFile = File(pickedImageFile.path);
      });
      getFileImage(index);
    } else if (images[index] == "Add Video") {
      final pickedImageFile =
          await ImagePicker().getVideo(source: ImageSource.gallery);
      if (pickedImageFile == null) return;
      setState(() {
        _videoFile = File(pickedImageFile.path);
      });
      _controller = VideoPlayerController.file(_videoFile);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _controller.play();
      getFileImage(index);
    }
    widget.imagePickFn(_imageFile, _videoFile);
  }

  void getFileImage(int index) {
    if (_imageFile != null || _videoFile != null) {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = _imageFile;
        imageUpload.imageUrl = '';
        if (images[index] == "Add Image") {
          imageUpload.type = "image";
        } else if (images[index] == "Add Video") {
          imageUpload.type = "video";
        }
        images.replaceRange(index, index + 1, [imageUpload]);
      });
    }
  }
}

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;
  String type;

  ImageUploadModel(
      {this.isUploaded,
      this.uploading,
      this.imageFile,
      this.imageUrl,
      this.type});
}
