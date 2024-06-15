// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:file_picker/file_picker.dart';

class UploadDropzone extends StatefulWidget {
  const UploadDropzone({
    super.key,
    this.width,
    this.height,
    this.onFileUploaded,
    required this.allowedTypes,
    this.maxSizeInKbytes,
  });

  final double? width;
  final double? height;
  final Future Function(FFUploadedFile? file, bool isSuccess, int? fileSize,
      String? fileName)? onFileUploaded;
  final List<String> allowedTypes;
  final int? maxSizeInKbytes;

  @override
  State<UploadDropzone> createState() => _UploadDropzoneState();
}

class _UploadDropzoneState extends State<UploadDropzone> {
  late DropzoneViewController controller;
  bool isDragging = false;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: widget.allowedTypes,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        print('File picked: ${file.name}');

        // Check file size
        if (widget.maxSizeInKbytes != null &&
            file.size > widget.maxSizeInKbytes! * 1024) {
          print('File size exceeds the maximum limit');
          if (widget.onFileUploaded != null) {
            await widget.onFileUploaded!(null, false, file.size, file.name);
          }
          return;
        }

        final ffFile = FFUploadedFile(
          name: file.name,
          bytes: file.bytes!,
        );
        if (widget.onFileUploaded != null) {
          print('Executing onFileUploaded callback');
          await widget.onFileUploaded!(ffFile, true, file.size, file.name);
          print('onFileUploaded callback executed');
        }
      } else {
        print('No file selected or file selection canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
      if (widget.onFileUploaded != null) {
        await widget.onFileUploaded!(null, false, null, null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _pickFile, // Переместили onTap внутрь контейнера
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: isDragging ? Color(0x1A000000) : Colors.transparent,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24), // Border radius
          ),
          child: Stack(
            children: [
              DropzoneView(
                onCreated: (ctrl) {
                  controller = ctrl;
                  print('DropzoneView created');
                },
                onDrop: (ev) async {
                  setState(() {
                    isDragging = false;
                  });
                  print('File dropped');
                  try {
                    final name = await controller.getFilename(ev);
                    final mime = await controller.getFileMIME(ev);
                    final size = await controller.getFileSize(ev);

                    // Check if file type is allowed
                    if (!widget.allowedTypes.contains(mime.split('/').last)) {
                      print('File type not allowed: $mime');
                      if (widget.onFileUploaded != null) {
                        await widget.onFileUploaded!(null, false, size, name);
                      }
                      return;
                    }

                    final bytes = await controller.getFileData(ev);

                    // Check file size
                    if (widget.maxSizeInKbytes != null &&
                        size > widget.maxSizeInKbytes! * 1024) {
                      print('File size exceeds the maximum limit');
                      if (widget.onFileUploaded != null) {
                        await widget.onFileUploaded!(null, false, size, name);
                      }
                      return;
                    }

                    print('File received: $name');
                    final ffFile = FFUploadedFile(
                      name: name,
                      bytes: bytes,
                    );
                    if (widget.onFileUploaded != null) {
                      print('Executing onFileUploaded callback');
                      await widget.onFileUploaded!(ffFile, true, size, name);
                      print('onFileUploaded callback executed');
                    } else {
                      print('onFileUploaded callback is null');
                    }
                  } catch (e) {
                    print('Error during file processing: $e');
                    if (widget.onFileUploaded != null) {
                      await widget.onFileUploaded!(null, false, null, null);
                    }
                  }
                },
                onHover: () {
                  setState(() {
                    isDragging = true;
                  });
                },
                onLeave: () {
                  setState(() {
                    isDragging = false;
                  });
                },
              ),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
