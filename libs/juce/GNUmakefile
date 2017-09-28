# Project: juce
# Makefile created by Dev-C++ 4.9.9.2

prefix = /usr
libdir = $(prefix)/lib
includedir = $(prefix)/include

PLATFORM ?= win32

CPP  = g++
CC   = gcc
WINDRES = windres
RES  = 
OBJ  = bin/juce_Logger.o bin/juce_Random.o bin/juce_RelativeTime.o bin/juce_SystemStats.o bin/juce_Time.o bin/juce_BitArray.o bin/juce_MemoryBlock.o bin/juce_BlowFish.o bin/juce_MD5.o bin/juce_Primes.o bin/juce_RSAKey.o bin/juce_InputStream.o bin/juce_OutputStream.o bin/juce_DirectoryIterator.o bin/juce_File.o bin/juce_FileInputStream.o bin/juce_FileOutputStream.o bin/juce_FileSearchPath.o bin/juce_URL.o bin/juce_BufferedInputStream.o bin/juce_GZIPCompressorOutputStream.o bin/juce_GZIPDecompressorInputStream.o bin/juce_MemoryInputStream.o bin/juce_MemoryOutputStream.o bin/juce_SubregionStream.o bin/juce_PerformanceCounter.o bin/juce_Uuid.o bin/juce_ZipFile.o bin/juce_String.o bin/juce_StringArray.o bin/juce_StringPairArray.o bin/juce_XmlDocument.o bin/juce_XmlElement.o bin/juce_InterProcessLock.o bin/juce_Thread.o bin/juce_ThreadPool.o bin/juce_Application.o bin/juce_DeletedAtShutdown.o bin/juce_AiffAudioFormat.o bin/juce_AudioCDReader.o bin/juce_AudioFormat.o bin/juce_AudioSubsectionReader.o bin/juce_WavAudioFormat.o bin/juce_ActionBroadcaster.o bin/juce_ActionListenerList.o bin/juce_AsyncUpdater.o bin/juce_ChangeBroadcaster.o bin/juce_ChangeListenerList.o bin/juce_Message.o bin/juce_MessageListener.o bin/juce_MessageManager.o bin/juce_Timer.o bin/juce_Brush.o bin/juce_GradientBrush.o bin/juce_ImageBrush.o bin/juce_SolidColourBrush.o bin/juce_Colour.o bin/juce_Colours.o bin/juce_EdgeTable.o bin/juce_Graphics.o bin/juce_Justification.o bin/juce_DropShadowEffect.o bin/juce_GlowEffect.o bin/juce_ReduceOpacityEffect.o bin/juce_Font.o bin/juce_GlyphArrangement.o bin/juce_TextLayout.o bin/juce_Typeface.o bin/juce_AffineTransform.o bin/juce_Line.o bin/juce_Path.o bin/juce_PathIterator.o bin/juce_PathStrokeType.o bin/juce_Point.o bin/juce_Rectangle.o bin/juce_RectangleList.o bin/juce_Image.o bin/juce_ImageCache.o bin/juce_ImageConvolutionKernel.o bin/juce_ImageFileFormat.o bin/juce_GIFLoader.o bin/juce_JPEGLoader.o bin/juce_PNGLoader.o bin/juce_AudioFormatReaderSource.o bin/juce_AudioSourcePlayer.o bin/juce_AudioTransportSource.o bin/juce_BufferingAudioSource.o bin/juce_MixerAudioSource.o bin/juce_ResamplingAudioSource.o bin/juce_TimeSliceThread.o bin/juce_ReadWriteLock.o bin/juce_LocalisedStrings.o bin/juce_PropertySet.o bin/juce_Drawable.o bin/juce_DrawableComposite.o bin/juce_DrawableImage.o bin/juce_DrawablePath.o bin/juce_DrawableText.o bin/juce_ColourGradient.o bin/juce_ArrowButton.o bin/juce_Button.o bin/juce_DrawableButton.o bin/juce_HyperlinkButton.o bin/juce_ImageButton.o bin/juce_ShapeButton.o bin/juce_TextButton.o bin/juce_ToggleButton.o bin/juce_ComboBox.o bin/juce_Label.o bin/juce_ListBox.o bin/juce_ProgressBar.o bin/juce_Slider.o bin/juce_TextEditor.o bin/juce_TreeView.o bin/juce_KeyListener.o bin/juce_KeyMappingEditorComponent.o bin/juce_KeyPress.o bin/juce_KeyPressMappingSet.o bin/juce_ModifierKeys.o bin/juce_GroupComponent.o bin/juce_ResizableBorderComponent.o bin/juce_ResizableCornerComponent.o bin/juce_ScrollBar.o bin/juce_StretchableLayoutManager.o bin/juce_StretchableLayoutResizerBar.o bin/juce_TabbedButtonBar.o bin/juce_TabbedComponent.o bin/juce_Viewport.o bin/juce_LookAndFeel.o bin/juce_ShinyLookAndFeel.o bin/juce_PopupMenu.o bin/juce_ComponentDragger.o bin/juce_DragAndDropContainer.o bin/juce_MouseCursor.o bin/juce_MouseEvent.o bin/juce_MouseHoverDetector.o bin/juce_MouseListener.o bin/juce_BubbleComponent.o bin/juce_ColourSelector.o bin/juce_DropShadower.o bin/juce_OpenGLComponent.o bin/juce_PreferencesPanel.o bin/juce_QuickTimeMovieComponent.o bin/juce_AlertWindow.o bin/juce_DialogWindow.o bin/juce_ResizableWindow.o bin/juce_SplashScreen.o bin/juce_ThreadWithProgressWindow.o bin/juce_ToolTipWindow.o bin/juce_MenuBarComponent.o bin/juce_BubbleMessageComponent.o bin/juce_Component.o bin/juce_ComponentListener.o bin/juce_Desktop.o bin/juce_ToneGeneratorAudioSource.o bin/adler32.o bin/compress.o bin/crc32.o bin/deflate.o bin/infback.o bin/inffast.o bin/inflate.o bin/inftrees.o bin/trees.o bin/uncompr.o bin/zutil.o bin/png.o bin/pngerror.o bin/pnggccrd.o bin/pngget.o bin/pngmem.o bin/pngpread.o bin/pngread.o bin/pngrio.o bin/pngrtran.o bin/pngrutil.o bin/pngset.o bin/pngtrans.o bin/pngvcrd.o bin/pngwio.o bin/pngwrite.o bin/pngwtran.o bin/pngwutil.o bin/jcapimin.o bin/jcapistd.o bin/jccoefct.o bin/jccolor.o bin/jcdctmgr.o bin/jchuff.o bin/jcinit.o bin/jcmainct.o bin/jcmarker.o bin/jcmaster.o bin/jcomapi.o bin/jcparam.o bin/jcphuff.o bin/jcprepct.o bin/jcsample.o bin/jctrans.o bin/jdapimin.o bin/jdapistd.o bin/jdatasrc.o bin/jdcoefct.o bin/jdcolor.o bin/jddctmgr.o bin/jdhuff.o bin/jdinput.o bin/jdmainct.o bin/jdmarker.o bin/jdmaster.o bin/jdmerge.o bin/jdphuff.o bin/jdpostct.o bin/jdsample.o bin/jdtrans.o bin/jerror.o bin/jfdctflt.o bin/jfdctfst.o bin/jfdctint.o bin/jidctflt.o bin/jidctfst.o bin/jidctint.o bin/jidctred.o bin/jmemmgr.o bin/jmemnobs.o bin/jquant1.o bin/jquant2.o bin/jutils.o bin/transupp.o bin/juce_MidiKeyboardComponent.o bin/juce_AudioFormatManager.o bin/juce_LowLevelGraphicsSoftwareRenderer.o bin/juce_AudioDeviceManager.o bin/juce_AudioDeviceSelectorComponent.o bin/juce_DocumentWindow.o bin/juce_ComponentBoundsConstrainer.o bin/juce_MidiBuffer.o bin/juce_MidiFile.o bin/juce_MidiKeyboardState.o bin/juce_MidiMessage.o bin/juce_MidiMessageCollector.o bin/juce_MidiMessageSequence.o bin/juce_TopLevelWindow.o bin/juce_ComponentPeer.o bin/juce_BorderSize.o bin/juce_PropertiesFile.o bin/juce_FileBasedDocument.o bin/juce_RecentlyOpenedFilesList.o bin/juce_UndoManager.o bin/juce_DirectoryContentsList.o bin/juce_FileBrowserComponent.o bin/juce_FileChooser.o bin/juce_FileChooserDialogBox.o bin/juce_FileFilter.o bin/juce_FileListComponent.o bin/juce_ImagePreviewComponent.o bin/juce_WildcardFileFilter.o bin/juce_AudioIODevice.o bin/juce_AudioIODeviceType.o bin/juce_Socket.o bin/juce_NamedPipe.o bin/juce_InterprocessConnection.o bin/juce_InterprocessConnectionServer.o bin/juce_FlacAudioFormat.o bin/juce_OggVorbisAudioFormat.o bin/juce_ApplicationCommandInfo.o bin/juce_ApplicationCommandManager.o bin/juce_ApplicationCommandTarget.o bin/juce_PositionedRectangle.o bin/juce_MultiDocumentPanel.o bin/juce_ButtonPropertyComponent.o bin/juce_ChoicePropertyComponent.o bin/juce_PropertyComponent.o bin/juce_PropertyPanel.o bin/juce_SliderPropertyComponent.o bin/juce_TextPropertyComponent.o bin/juce_MagnifierComponent.o bin/juce_FilenameComponent.o bin/juce_KeyboardFocusTraverser.o bin/juce_BooleanPropertyComponent.o bin/juce_CharacterFunctions.o bin/juce_SVGParser.o bin/juce_RectanglePlacement.o bin/juce_TableHeaderComponent.o bin/juce_TableListBox.o bin/juce_StretchableObjectResizer.o bin/juce_Toolbar.o bin/juce_ToolbarItemComponent.o bin/juce_ToolbarItemPalette.o bin/juce_ComponentAnimator.o bin/juce_MultiTimer.o bin/juce_ToolbarButton.o bin/juce_Sampler.o bin/juce_Synthesiser.o bin/juce_ComponentMovementWatcher.o bin/juce_AudioDataConverters.o bin/juce_AudioSampleBuffer.o bin/juce_IIRFilter.o bin/juce_ApplicationProperties.o bin/juce_SystemTrayIconComponent.o bin/juce_MenuBarModel.o bin/juce_ChannelRemappingAudioSource.o $(RES)
LINKOBJ  = bin/juce_Logger.o bin/juce_Random.o bin/juce_RelativeTime.o bin/juce_SystemStats.o bin/juce_Time.o bin/juce_BitArray.o bin/juce_MemoryBlock.o bin/juce_BlowFish.o bin/juce_MD5.o bin/juce_Primes.o bin/juce_RSAKey.o bin/juce_InputStream.o bin/juce_OutputStream.o bin/juce_DirectoryIterator.o bin/juce_File.o bin/juce_FileInputStream.o bin/juce_FileOutputStream.o bin/juce_FileSearchPath.o bin/juce_URL.o bin/juce_BufferedInputStream.o bin/juce_GZIPCompressorOutputStream.o bin/juce_GZIPDecompressorInputStream.o bin/juce_MemoryInputStream.o bin/juce_MemoryOutputStream.o bin/juce_SubregionStream.o bin/juce_PerformanceCounter.o bin/juce_Uuid.o bin/juce_ZipFile.o bin/juce_String.o bin/juce_StringArray.o bin/juce_StringPairArray.o bin/juce_XmlDocument.o bin/juce_XmlElement.o bin/juce_InterProcessLock.o bin/juce_Thread.o bin/juce_ThreadPool.o bin/juce_Application.o bin/juce_DeletedAtShutdown.o bin/juce_AiffAudioFormat.o bin/juce_AudioCDReader.o bin/juce_AudioFormat.o bin/juce_AudioSubsectionReader.o bin/juce_WavAudioFormat.o bin/juce_ActionBroadcaster.o bin/juce_ActionListenerList.o bin/juce_AsyncUpdater.o bin/juce_ChangeBroadcaster.o bin/juce_ChangeListenerList.o bin/juce_Message.o bin/juce_MessageListener.o bin/juce_MessageManager.o bin/juce_Timer.o bin/juce_Brush.o bin/juce_GradientBrush.o bin/juce_ImageBrush.o bin/juce_SolidColourBrush.o bin/juce_Colour.o bin/juce_Colours.o bin/juce_EdgeTable.o bin/juce_Graphics.o bin/juce_Justification.o bin/juce_DropShadowEffect.o bin/juce_GlowEffect.o bin/juce_ReduceOpacityEffect.o bin/juce_Font.o bin/juce_GlyphArrangement.o bin/juce_TextLayout.o bin/juce_Typeface.o bin/juce_AffineTransform.o bin/juce_Line.o bin/juce_Path.o bin/juce_PathIterator.o bin/juce_PathStrokeType.o bin/juce_Point.o bin/juce_Rectangle.o bin/juce_RectangleList.o bin/juce_Image.o bin/juce_ImageCache.o bin/juce_ImageConvolutionKernel.o bin/juce_ImageFileFormat.o bin/juce_GIFLoader.o bin/juce_JPEGLoader.o bin/juce_PNGLoader.o bin/juce_AudioFormatReaderSource.o bin/juce_AudioSourcePlayer.o bin/juce_AudioTransportSource.o bin/juce_BufferingAudioSource.o bin/juce_MixerAudioSource.o bin/juce_ResamplingAudioSource.o bin/juce_TimeSliceThread.o bin/juce_ReadWriteLock.o bin/juce_LocalisedStrings.o bin/juce_PropertySet.o bin/juce_Drawable.o bin/juce_DrawableComposite.o bin/juce_DrawableImage.o bin/juce_DrawablePath.o bin/juce_DrawableText.o bin/juce_ColourGradient.o bin/juce_ArrowButton.o bin/juce_Button.o bin/juce_DrawableButton.o bin/juce_HyperlinkButton.o bin/juce_ImageButton.o bin/juce_ShapeButton.o bin/juce_TextButton.o bin/juce_ToggleButton.o bin/juce_ComboBox.o bin/juce_Label.o bin/juce_ListBox.o bin/juce_ProgressBar.o bin/juce_Slider.o bin/juce_TextEditor.o bin/juce_TreeView.o bin/juce_KeyListener.o bin/juce_KeyMappingEditorComponent.o bin/juce_KeyPress.o bin/juce_KeyPressMappingSet.o bin/juce_ModifierKeys.o bin/juce_GroupComponent.o bin/juce_ResizableBorderComponent.o bin/juce_ResizableCornerComponent.o bin/juce_ScrollBar.o bin/juce_StretchableLayoutManager.o bin/juce_StretchableLayoutResizerBar.o bin/juce_TabbedButtonBar.o bin/juce_TabbedComponent.o bin/juce_Viewport.o bin/juce_LookAndFeel.o bin/juce_ShinyLookAndFeel.o bin/juce_PopupMenu.o bin/juce_ComponentDragger.o bin/juce_DragAndDropContainer.o bin/juce_MouseCursor.o bin/juce_MouseEvent.o bin/juce_MouseHoverDetector.o bin/juce_MouseListener.o bin/juce_BubbleComponent.o bin/juce_ColourSelector.o bin/juce_DropShadower.o bin/juce_OpenGLComponent.o bin/juce_PreferencesPanel.o bin/juce_QuickTimeMovieComponent.o bin/juce_AlertWindow.o bin/juce_DialogWindow.o bin/juce_ResizableWindow.o bin/juce_SplashScreen.o bin/juce_ThreadWithProgressWindow.o bin/juce_ToolTipWindow.o bin/juce_MenuBarComponent.o bin/juce_BubbleMessageComponent.o bin/juce_Component.o bin/juce_ComponentListener.o bin/juce_Desktop.o bin/juce_ToneGeneratorAudioSource.o bin/adler32.o bin/compress.o bin/crc32.o bin/deflate.o bin/infback.o bin/inffast.o bin/inflate.o bin/inftrees.o bin/trees.o bin/uncompr.o bin/zutil.o bin/png.o bin/pngerror.o bin/pnggccrd.o bin/pngget.o bin/pngmem.o bin/pngpread.o bin/pngread.o bin/pngrio.o bin/pngrtran.o bin/pngrutil.o bin/pngset.o bin/pngtrans.o bin/pngvcrd.o bin/pngwio.o bin/pngwrite.o bin/pngwtran.o bin/pngwutil.o bin/jcapimin.o bin/jcapistd.o bin/jccoefct.o bin/jccolor.o bin/jcdctmgr.o bin/jchuff.o bin/jcinit.o bin/jcmainct.o bin/jcmarker.o bin/jcmaster.o bin/jcomapi.o bin/jcparam.o bin/jcphuff.o bin/jcprepct.o bin/jcsample.o bin/jctrans.o bin/jdapimin.o bin/jdapistd.o bin/jdatasrc.o bin/jdcoefct.o bin/jdcolor.o bin/jddctmgr.o bin/jdhuff.o bin/jdinput.o bin/jdmainct.o bin/jdmarker.o bin/jdmaster.o bin/jdmerge.o bin/jdphuff.o bin/jdpostct.o bin/jdsample.o bin/jdtrans.o bin/jerror.o bin/jfdctflt.o bin/jfdctfst.o bin/jfdctint.o bin/jidctflt.o bin/jidctfst.o bin/jidctint.o bin/jidctred.o bin/jmemmgr.o bin/jmemnobs.o bin/jquant1.o bin/jquant2.o bin/jutils.o bin/transupp.o bin/juce_MidiKeyboardComponent.o bin/juce_AudioFormatManager.o bin/juce_LowLevelGraphicsSoftwareRenderer.o bin/juce_AudioDeviceManager.o bin/juce_AudioDeviceSelectorComponent.o bin/juce_DocumentWindow.o bin/juce_ComponentBoundsConstrainer.o bin/juce_MidiBuffer.o bin/juce_MidiFile.o bin/juce_MidiKeyboardState.o bin/juce_MidiMessage.o bin/juce_MidiMessageCollector.o bin/juce_MidiMessageSequence.o bin/juce_TopLevelWindow.o bin/juce_ComponentPeer.o bin/juce_BorderSize.o bin/juce_PropertiesFile.o bin/juce_FileBasedDocument.o bin/juce_RecentlyOpenedFilesList.o bin/juce_UndoManager.o bin/juce_DirectoryContentsList.o bin/juce_FileBrowserComponent.o bin/juce_FileChooser.o bin/juce_FileChooserDialogBox.o bin/juce_FileFilter.o bin/juce_FileListComponent.o bin/juce_ImagePreviewComponent.o bin/juce_WildcardFileFilter.o bin/juce_AudioIODevice.o bin/juce_AudioIODeviceType.o bin/juce_Socket.o bin/juce_NamedPipe.o bin/juce_InterprocessConnection.o bin/juce_InterprocessConnectionServer.o bin/juce_FlacAudioFormat.o bin/juce_OggVorbisAudioFormat.o bin/juce_ApplicationCommandInfo.o bin/juce_ApplicationCommandManager.o bin/juce_ApplicationCommandTarget.o bin/juce_PositionedRectangle.o bin/juce_MultiDocumentPanel.o bin/juce_ButtonPropertyComponent.o bin/juce_ChoicePropertyComponent.o bin/juce_PropertyComponent.o bin/juce_PropertyPanel.o bin/juce_SliderPropertyComponent.o bin/juce_TextPropertyComponent.o bin/juce_MagnifierComponent.o bin/juce_FilenameComponent.o bin/juce_KeyboardFocusTraverser.o bin/juce_BooleanPropertyComponent.o bin/juce_CharacterFunctions.o bin/juce_SVGParser.o bin/juce_RectanglePlacement.o bin/juce_TableHeaderComponent.o bin/juce_TableListBox.o bin/juce_StretchableObjectResizer.o bin/juce_Toolbar.o bin/juce_ToolbarItemComponent.o bin/juce_ToolbarItemPalette.o bin/juce_ComponentAnimator.o bin/juce_MultiTimer.o bin/juce_ToolbarButton.o bin/juce_Sampler.o bin/juce_Synthesiser.o bin/juce_ComponentMovementWatcher.o bin/juce_AudioDataConverters.o bin/juce_AudioSampleBuffer.o bin/juce_IIRFilter.o bin/juce_ApplicationProperties.o bin/juce_SystemTrayIconComponent.o bin/juce_MenuBarModel.o bin/juce_ChannelRemappingAudioSource.o $(RES)
LIBS =  -L$(libdir) -s
INCS =  -I$(includedir)
CXXINCS = 
BIN  = bin/libjuce.a
CXXFLAGS = $(DEFS) $(CXXINCS) -Wno-multichar -DJUCE_USE_FLAC=0 -DJUCE_USE_OGGVORBIS=0   -Wall -fexceptions -fexpensive-optimizations -O3
CFLAGS = $(INCS)   -Wall -fexceptions -fexpensive-optimizations -O3
RM = rm -f

win32_OBJ =  bin/juce_win32_ASIO.o bin/juce_win32_AudioCDReader.o bin/juce_win32_DirectSound.o bin/juce_win32_DynamicLibraryLoader.o bin/juce_win32_FileChooser.o bin/juce_win32_Files.o bin/juce_win32_Fonts.o bin/juce_win32_Messaging.o bin/juce_win32_Midi.o bin/juce_win32_Misc.o bin/juce_win32_Network.o bin/juce_win32_PlatformUtils.o bin/juce_win32_SystemStats.o bin/juce_win32_Threads.o bin/juce_win32_Windowing.o
win32_LINKOBJ = bin/juce_win32_ASIO.o bin/juce_win32_AudioCDReader.o bin/juce_win32_DirectSound.o bin/juce_win32_DynamicLibraryLoader.o bin/juce_win32_FileChooser.o bin/juce_win32_Files.o bin/juce_win32_Fonts.o bin/juce_win32_Messaging.o bin/juce_win32_Midi.o bin/juce_win32_Misc.o bin/juce_win32_Network.o bin/juce_win32_PlatformUtils.o bin/juce_win32_SystemStats.o bin/juce_win32_Threads.o bin/juce_win32_Windowing.o

.PHONY: all all-before all-after clean clean-custom

all: all-before bin/libjuce.a all-after


clean: clean-custom
	${RM} $(OBJ) $(BIN)

$(BIN): $(LINKOBJ)
	ar r $(BIN) $(LINKOBJ)
	ranlib $(BIN)

bin/juce_Logger.o: src/juce_core/basics/juce_Logger.cpp
	$(CPP) -c src/juce_core/basics/juce_Logger.cpp -o bin/juce_Logger.o $(CXXFLAGS)

bin/juce_Random.o: src/juce_core/basics/juce_Random.cpp
	$(CPP) -c src/juce_core/basics/juce_Random.cpp -o bin/juce_Random.o $(CXXFLAGS)

bin/juce_RelativeTime.o: src/juce_core/basics/juce_RelativeTime.cpp
	$(CPP) -c src/juce_core/basics/juce_RelativeTime.cpp -o bin/juce_RelativeTime.o $(CXXFLAGS)

bin/juce_SystemStats.o: src/juce_core/basics/juce_SystemStats.cpp
	$(CPP) -c src/juce_core/basics/juce_SystemStats.cpp -o bin/juce_SystemStats.o $(CXXFLAGS)

bin/juce_Time.o: src/juce_core/basics/juce_Time.cpp
	$(CPP) -c src/juce_core/basics/juce_Time.cpp -o bin/juce_Time.o $(CXXFLAGS)

bin/juce_BitArray.o: src/juce_core/containers/juce_BitArray.cpp
	$(CPP) -c src/juce_core/containers/juce_BitArray.cpp -o bin/juce_BitArray.o $(CXXFLAGS)

bin/juce_MemoryBlock.o: src/juce_core/containers/juce_MemoryBlock.cpp
	$(CPP) -c src/juce_core/containers/juce_MemoryBlock.cpp -o bin/juce_MemoryBlock.o $(CXXFLAGS)

bin/juce_BlowFish.o: src/juce_core/cryptography/juce_BlowFish.cpp
	$(CPP) -c src/juce_core/cryptography/juce_BlowFish.cpp -o bin/juce_BlowFish.o $(CXXFLAGS)

bin/juce_MD5.o: src/juce_core/cryptography/juce_MD5.cpp
	$(CPP) -c src/juce_core/cryptography/juce_MD5.cpp -o bin/juce_MD5.o $(CXXFLAGS)

bin/juce_Primes.o: src/juce_core/cryptography/juce_Primes.cpp
	$(CPP) -c src/juce_core/cryptography/juce_Primes.cpp -o bin/juce_Primes.o $(CXXFLAGS)

bin/juce_RSAKey.o: src/juce_core/cryptography/juce_RSAKey.cpp
	$(CPP) -c src/juce_core/cryptography/juce_RSAKey.cpp -o bin/juce_RSAKey.o $(CXXFLAGS)

bin/juce_InputStream.o: src/juce_core/io/juce_InputStream.cpp
	$(CPP) -c src/juce_core/io/juce_InputStream.cpp -o bin/juce_InputStream.o $(CXXFLAGS)

bin/juce_OutputStream.o: src/juce_core/io/juce_OutputStream.cpp
	$(CPP) -c src/juce_core/io/juce_OutputStream.cpp -o bin/juce_OutputStream.o $(CXXFLAGS)

bin/juce_DirectoryIterator.o: src/juce_core/io/files/juce_DirectoryIterator.cpp
	$(CPP) -c src/juce_core/io/files/juce_DirectoryIterator.cpp -o bin/juce_DirectoryIterator.o $(CXXFLAGS)

bin/juce_File.o: src/juce_core/io/files/juce_File.cpp
	$(CPP) -c src/juce_core/io/files/juce_File.cpp -o bin/juce_File.o $(CXXFLAGS)

bin/juce_FileInputStream.o: src/juce_core/io/files/juce_FileInputStream.cpp
	$(CPP) -c src/juce_core/io/files/juce_FileInputStream.cpp -o bin/juce_FileInputStream.o $(CXXFLAGS)

bin/juce_FileOutputStream.o: src/juce_core/io/files/juce_FileOutputStream.cpp
	$(CPP) -c src/juce_core/io/files/juce_FileOutputStream.cpp -o bin/juce_FileOutputStream.o $(CXXFLAGS)

bin/juce_FileSearchPath.o: src/juce_core/io/files/juce_FileSearchPath.cpp
	$(CPP) -c src/juce_core/io/files/juce_FileSearchPath.cpp -o bin/juce_FileSearchPath.o $(CXXFLAGS)

bin/juce_URL.o: src/juce_core/io/network/juce_URL.cpp
	$(CPP) -c src/juce_core/io/network/juce_URL.cpp -o bin/juce_URL.o $(CXXFLAGS)

bin/juce_BufferedInputStream.o: src/juce_core/io/streams/juce_BufferedInputStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_BufferedInputStream.cpp -o bin/juce_BufferedInputStream.o $(CXXFLAGS)

bin/juce_GZIPCompressorOutputStream.o: src/juce_core/io/streams/juce_GZIPCompressorOutputStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_GZIPCompressorOutputStream.cpp -o bin/juce_GZIPCompressorOutputStream.o $(CXXFLAGS)

bin/juce_GZIPDecompressorInputStream.o: src/juce_core/io/streams/juce_GZIPDecompressorInputStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_GZIPDecompressorInputStream.cpp -o bin/juce_GZIPDecompressorInputStream.o $(CXXFLAGS)

bin/juce_MemoryInputStream.o: src/juce_core/io/streams/juce_MemoryInputStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_MemoryInputStream.cpp -o bin/juce_MemoryInputStream.o $(CXXFLAGS)

bin/juce_MemoryOutputStream.o: src/juce_core/io/streams/juce_MemoryOutputStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_MemoryOutputStream.cpp -o bin/juce_MemoryOutputStream.o $(CXXFLAGS)

bin/juce_SubregionStream.o: src/juce_core/io/streams/juce_SubregionStream.cpp
	$(CPP) -c src/juce_core/io/streams/juce_SubregionStream.cpp -o bin/juce_SubregionStream.o $(CXXFLAGS)

bin/juce_PerformanceCounter.o: src/juce_core/misc/juce_PerformanceCounter.cpp
	$(CPP) -c src/juce_core/misc/juce_PerformanceCounter.cpp -o bin/juce_PerformanceCounter.o $(CXXFLAGS)

bin/juce_Uuid.o: src/juce_core/misc/juce_Uuid.cpp
	$(CPP) -c src/juce_core/misc/juce_Uuid.cpp -o bin/juce_Uuid.o $(CXXFLAGS)

bin/juce_ZipFile.o: src/juce_core/misc/juce_ZipFile.cpp
	$(CPP) -c src/juce_core/misc/juce_ZipFile.cpp -o bin/juce_ZipFile.o $(CXXFLAGS)

bin/juce_String.o: src/juce_core/text/juce_String.cpp
	$(CPP) -c src/juce_core/text/juce_String.cpp -o bin/juce_String.o $(CXXFLAGS)

bin/juce_StringArray.o: src/juce_core/text/juce_StringArray.cpp
	$(CPP) -c src/juce_core/text/juce_StringArray.cpp -o bin/juce_StringArray.o $(CXXFLAGS)

bin/juce_StringPairArray.o: src/juce_core/text/juce_StringPairArray.cpp
	$(CPP) -c src/juce_core/text/juce_StringPairArray.cpp -o bin/juce_StringPairArray.o $(CXXFLAGS)

bin/juce_XmlDocument.o: src/juce_core/text/juce_XmlDocument.cpp
	$(CPP) -c src/juce_core/text/juce_XmlDocument.cpp -o bin/juce_XmlDocument.o $(CXXFLAGS)

bin/juce_XmlElement.o: src/juce_core/text/juce_XmlElement.cpp
	$(CPP) -c src/juce_core/text/juce_XmlElement.cpp -o bin/juce_XmlElement.o $(CXXFLAGS)

bin/juce_InterProcessLock.o: src/juce_core/threads/juce_InterProcessLock.cpp
	$(CPP) -c src/juce_core/threads/juce_InterProcessLock.cpp -o bin/juce_InterProcessLock.o $(CXXFLAGS)

bin/juce_Thread.o: src/juce_core/threads/juce_Thread.cpp
	$(CPP) -c src/juce_core/threads/juce_Thread.cpp -o bin/juce_Thread.o $(CXXFLAGS)

bin/juce_ThreadPool.o: src/juce_core/threads/juce_ThreadPool.cpp
	$(CPP) -c src/juce_core/threads/juce_ThreadPool.cpp -o bin/juce_ThreadPool.o $(CXXFLAGS)

bin/juce_Application.o: src/juce_appframework/application/juce_Application.cpp
	$(CPP) -c src/juce_appframework/application/juce_Application.cpp -o bin/juce_Application.o $(CXXFLAGS)

bin/juce_DeletedAtShutdown.o: src/juce_appframework/application/juce_DeletedAtShutdown.cpp
	$(CPP) -c src/juce_appframework/application/juce_DeletedAtShutdown.cpp -o bin/juce_DeletedAtShutdown.o $(CXXFLAGS)

bin/juce_AiffAudioFormat.o: src/juce_appframework/audio/audio_file_formats/juce_AiffAudioFormat.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_AiffAudioFormat.cpp -o bin/juce_AiffAudioFormat.o $(CXXFLAGS)

bin/juce_AudioCDReader.o: src/juce_appframework/audio/audio_file_formats/juce_AudioCDReader.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_AudioCDReader.cpp -o bin/juce_AudioCDReader.o $(CXXFLAGS)

bin/juce_AudioFormat.o: src/juce_appframework/audio/audio_file_formats/juce_AudioFormat.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_AudioFormat.cpp -o bin/juce_AudioFormat.o $(CXXFLAGS)

bin/juce_AudioSubsectionReader.o: src/juce_appframework/audio/audio_file_formats/juce_AudioSubsectionReader.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_AudioSubsectionReader.cpp -o bin/juce_AudioSubsectionReader.o $(CXXFLAGS)

bin/juce_WavAudioFormat.o: src/juce_appframework/audio/audio_file_formats/juce_WavAudioFormat.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_WavAudioFormat.cpp -o bin/juce_WavAudioFormat.o $(CXXFLAGS)

bin/juce_ActionBroadcaster.o: src/juce_appframework/events/juce_ActionBroadcaster.cpp
	$(CPP) -c src/juce_appframework/events/juce_ActionBroadcaster.cpp -o bin/juce_ActionBroadcaster.o $(CXXFLAGS)

bin/juce_ActionListenerList.o: src/juce_appframework/events/juce_ActionListenerList.cpp
	$(CPP) -c src/juce_appframework/events/juce_ActionListenerList.cpp -o bin/juce_ActionListenerList.o $(CXXFLAGS)

bin/juce_AsyncUpdater.o: src/juce_appframework/events/juce_AsyncUpdater.cpp
	$(CPP) -c src/juce_appframework/events/juce_AsyncUpdater.cpp -o bin/juce_AsyncUpdater.o $(CXXFLAGS)

bin/juce_ChangeBroadcaster.o: src/juce_appframework/events/juce_ChangeBroadcaster.cpp
	$(CPP) -c src/juce_appframework/events/juce_ChangeBroadcaster.cpp -o bin/juce_ChangeBroadcaster.o $(CXXFLAGS)

bin/juce_ChangeListenerList.o: src/juce_appframework/events/juce_ChangeListenerList.cpp
	$(CPP) -c src/juce_appframework/events/juce_ChangeListenerList.cpp -o bin/juce_ChangeListenerList.o $(CXXFLAGS)

bin/juce_Message.o: src/juce_appframework/events/juce_Message.cpp
	$(CPP) -c src/juce_appframework/events/juce_Message.cpp -o bin/juce_Message.o $(CXXFLAGS)

bin/juce_MessageListener.o: src/juce_appframework/events/juce_MessageListener.cpp
	$(CPP) -c src/juce_appframework/events/juce_MessageListener.cpp -o bin/juce_MessageListener.o $(CXXFLAGS)

bin/juce_MessageManager.o: src/juce_appframework/events/juce_MessageManager.cpp
	$(CPP) -c src/juce_appframework/events/juce_MessageManager.cpp -o bin/juce_MessageManager.o $(CXXFLAGS)

bin/juce_Timer.o: src/juce_appframework/events/juce_Timer.cpp
	$(CPP) -c src/juce_appframework/events/juce_Timer.cpp -o bin/juce_Timer.o $(CXXFLAGS)

bin/juce_Brush.o: src/juce_appframework/gui/graphics/brushes/juce_Brush.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/brushes/juce_Brush.cpp -o bin/juce_Brush.o $(CXXFLAGS)

bin/juce_GradientBrush.o: src/juce_appframework/gui/graphics/brushes/juce_GradientBrush.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/brushes/juce_GradientBrush.cpp -o bin/juce_GradientBrush.o $(CXXFLAGS)

bin/juce_ImageBrush.o: src/juce_appframework/gui/graphics/brushes/juce_ImageBrush.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/brushes/juce_ImageBrush.cpp -o bin/juce_ImageBrush.o $(CXXFLAGS)

bin/juce_SolidColourBrush.o: src/juce_appframework/gui/graphics/brushes/juce_SolidColourBrush.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/brushes/juce_SolidColourBrush.cpp -o bin/juce_SolidColourBrush.o $(CXXFLAGS)

bin/juce_Colour.o: src/juce_appframework/gui/graphics/colour/juce_Colour.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/colour/juce_Colour.cpp -o bin/juce_Colour.o $(CXXFLAGS)

bin/juce_Colours.o: src/juce_appframework/gui/graphics/colour/juce_Colours.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/colour/juce_Colours.cpp -o bin/juce_Colours.o $(CXXFLAGS)

bin/juce_EdgeTable.o: src/juce_appframework/gui/graphics/contexts/juce_EdgeTable.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/contexts/juce_EdgeTable.cpp -o bin/juce_EdgeTable.o $(CXXFLAGS)

bin/juce_Graphics.o: src/juce_appframework/gui/graphics/contexts/juce_Graphics.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/contexts/juce_Graphics.cpp -o bin/juce_Graphics.o $(CXXFLAGS)

bin/juce_Justification.o: src/juce_appframework/gui/graphics/contexts/juce_Justification.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/contexts/juce_Justification.cpp -o bin/juce_Justification.o $(CXXFLAGS)

bin/juce_DropShadowEffect.o: src/juce_appframework/gui/graphics/effects/juce_DropShadowEffect.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/effects/juce_DropShadowEffect.cpp -o bin/juce_DropShadowEffect.o $(CXXFLAGS)

bin/juce_GlowEffect.o: src/juce_appframework/gui/graphics/effects/juce_GlowEffect.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/effects/juce_GlowEffect.cpp -o bin/juce_GlowEffect.o $(CXXFLAGS)

bin/juce_ReduceOpacityEffect.o: src/juce_appframework/gui/graphics/effects/juce_ReduceOpacityEffect.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/effects/juce_ReduceOpacityEffect.cpp -o bin/juce_ReduceOpacityEffect.o $(CXXFLAGS)

bin/juce_Font.o: src/juce_appframework/gui/graphics/fonts/juce_Font.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/fonts/juce_Font.cpp -o bin/juce_Font.o $(CXXFLAGS)

bin/juce_GlyphArrangement.o: src/juce_appframework/gui/graphics/fonts/juce_GlyphArrangement.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/fonts/juce_GlyphArrangement.cpp -o bin/juce_GlyphArrangement.o $(CXXFLAGS)

bin/juce_TextLayout.o: src/juce_appframework/gui/graphics/fonts/juce_TextLayout.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/fonts/juce_TextLayout.cpp -o bin/juce_TextLayout.o $(CXXFLAGS)

bin/juce_Typeface.o: src/juce_appframework/gui/graphics/fonts/juce_Typeface.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/fonts/juce_Typeface.cpp -o bin/juce_Typeface.o $(CXXFLAGS)

bin/juce_AffineTransform.o: src/juce_appframework/gui/graphics/geometry/juce_AffineTransform.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_AffineTransform.cpp -o bin/juce_AffineTransform.o $(CXXFLAGS)

bin/juce_Line.o: src/juce_appframework/gui/graphics/geometry/juce_Line.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_Line.cpp -o bin/juce_Line.o $(CXXFLAGS)

bin/juce_Path.o: src/juce_appframework/gui/graphics/geometry/juce_Path.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_Path.cpp -o bin/juce_Path.o $(CXXFLAGS)

bin/juce_PathIterator.o: src/juce_appframework/gui/graphics/geometry/juce_PathIterator.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_PathIterator.cpp -o bin/juce_PathIterator.o $(CXXFLAGS)

bin/juce_PathStrokeType.o: src/juce_appframework/gui/graphics/geometry/juce_PathStrokeType.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_PathStrokeType.cpp -o bin/juce_PathStrokeType.o $(CXXFLAGS)

bin/juce_Point.o: src/juce_appframework/gui/graphics/geometry/juce_Point.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_Point.cpp -o bin/juce_Point.o $(CXXFLAGS)

bin/juce_Rectangle.o: src/juce_appframework/gui/graphics/geometry/juce_Rectangle.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_Rectangle.cpp -o bin/juce_Rectangle.o $(CXXFLAGS)

bin/juce_RectangleList.o: src/juce_appframework/gui/graphics/geometry/juce_RectangleList.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_RectangleList.cpp -o bin/juce_RectangleList.o $(CXXFLAGS)

bin/juce_Image.o: src/juce_appframework/gui/graphics/imaging/juce_Image.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/juce_Image.cpp -o bin/juce_Image.o $(CXXFLAGS)

bin/juce_ImageCache.o: src/juce_appframework/gui/graphics/imaging/juce_ImageCache.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/juce_ImageCache.cpp -o bin/juce_ImageCache.o $(CXXFLAGS)

bin/juce_ImageConvolutionKernel.o: src/juce_appframework/gui/graphics/imaging/juce_ImageConvolutionKernel.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/juce_ImageConvolutionKernel.cpp -o bin/juce_ImageConvolutionKernel.o $(CXXFLAGS)

bin/juce_ImageFileFormat.o: src/juce_appframework/gui/graphics/imaging/juce_ImageFileFormat.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/juce_ImageFileFormat.cpp -o bin/juce_ImageFileFormat.o $(CXXFLAGS)

bin/juce_GIFLoader.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_GIFLoader.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_GIFLoader.cpp -o bin/juce_GIFLoader.o $(CXXFLAGS)

bin/juce_JPEGLoader.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_JPEGLoader.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_JPEGLoader.cpp -o bin/juce_JPEGLoader.o $(CXXFLAGS)

bin/juce_PNGLoader.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_PNGLoader.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/juce_PNGLoader.cpp -o bin/juce_PNGLoader.o $(CXXFLAGS)

bin/juce_win32_ASIO.o: build/win32/platform_specific_code/juce_win32_ASIO.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_ASIO.cpp -o bin/juce_win32_ASIO.o $(CXXFLAGS)

bin/juce_win32_AudioCDReader.o: build/win32/platform_specific_code/juce_win32_AudioCDReader.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_AudioCDReader.cpp -o bin/juce_win32_AudioCDReader.o $(CXXFLAGS)

bin/juce_win32_DirectSound.o: build/win32/platform_specific_code/juce_win32_DirectSound.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_DirectSound.cpp -o bin/juce_win32_DirectSound.o $(CXXFLAGS)

bin/juce_win32_DynamicLibraryLoader.o: build/win32/platform_specific_code/juce_win32_DynamicLibraryLoader.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_DynamicLibraryLoader.cpp -o bin/juce_win32_DynamicLibraryLoader.o $(CXXFLAGS)

bin/juce_win32_FileChooser.o: build/win32/platform_specific_code/juce_win32_FileChooser.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_FileChooser.cpp -o bin/juce_win32_FileChooser.o $(CXXFLAGS)

bin/juce_win32_Files.o: build/win32/platform_specific_code/juce_win32_Files.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Files.cpp -o bin/juce_win32_Files.o $(CXXFLAGS)

bin/juce_win32_Fonts.o: build/win32/platform_specific_code/juce_win32_Fonts.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Fonts.cpp -o bin/juce_win32_Fonts.o $(CXXFLAGS)

bin/juce_win32_Messaging.o: build/win32/platform_specific_code/juce_win32_Messaging.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Messaging.cpp -o bin/juce_win32_Messaging.o $(CXXFLAGS)

bin/juce_win32_Midi.o: build/win32/platform_specific_code/juce_win32_Midi.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Midi.cpp -o bin/juce_win32_Midi.o $(CXXFLAGS)

bin/juce_win32_Misc.o: build/win32/platform_specific_code/juce_win32_Misc.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Misc.cpp -o bin/juce_win32_Misc.o $(CXXFLAGS)

bin/juce_win32_Network.o: build/win32/platform_specific_code/juce_win32_Network.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Network.cpp -o bin/juce_win32_Network.o $(CXXFLAGS)

bin/juce_win32_PlatformUtils.o: build/win32/platform_specific_code/juce_win32_PlatformUtils.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_PlatformUtils.cpp -o bin/juce_win32_PlatformUtils.o $(CXXFLAGS)

bin/juce_win32_SystemStats.o: build/win32/platform_specific_code/juce_win32_SystemStats.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_SystemStats.cpp -o bin/juce_win32_SystemStats.o $(CXXFLAGS)

bin/juce_win32_Threads.o: build/win32/platform_specific_code/juce_win32_Threads.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Threads.cpp -o bin/juce_win32_Threads.o $(CXXFLAGS)

bin/juce_win32_Windowing.o: build/win32/platform_specific_code/juce_win32_Windowing.cpp
	$(CPP) -c build/win32/platform_specific_code/juce_win32_Windowing.cpp -o bin/juce_win32_Windowing.o $(CXXFLAGS)

bin/juce_AudioFormatReaderSource.o: src/juce_appframework/audio/audio_sources/juce_AudioFormatReaderSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_AudioFormatReaderSource.cpp -o bin/juce_AudioFormatReaderSource.o $(CXXFLAGS)

bin/juce_AudioSourcePlayer.o: src/juce_appframework/audio/audio_sources/juce_AudioSourcePlayer.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_AudioSourcePlayer.cpp -o bin/juce_AudioSourcePlayer.o $(CXXFLAGS)

bin/juce_AudioTransportSource.o: src/juce_appframework/audio/audio_sources/juce_AudioTransportSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_AudioTransportSource.cpp -o bin/juce_AudioTransportSource.o $(CXXFLAGS)

bin/juce_BufferingAudioSource.o: src/juce_appframework/audio/audio_sources/juce_BufferingAudioSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_BufferingAudioSource.cpp -o bin/juce_BufferingAudioSource.o $(CXXFLAGS)

bin/juce_MixerAudioSource.o: src/juce_appframework/audio/audio_sources/juce_MixerAudioSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_MixerAudioSource.cpp -o bin/juce_MixerAudioSource.o $(CXXFLAGS)

bin/juce_ResamplingAudioSource.o: src/juce_appframework/audio/audio_sources/juce_ResamplingAudioSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_ResamplingAudioSource.cpp -o bin/juce_ResamplingAudioSource.o $(CXXFLAGS)

bin/juce_TimeSliceThread.o: src/juce_core/threads/juce_TimeSliceThread.cpp
	$(CPP) -c src/juce_core/threads/juce_TimeSliceThread.cpp -o bin/juce_TimeSliceThread.o $(CXXFLAGS)

bin/juce_ReadWriteLock.o: src/juce_core/threads/juce_ReadWriteLock.cpp
	$(CPP) -c src/juce_core/threads/juce_ReadWriteLock.cpp -o bin/juce_ReadWriteLock.o $(CXXFLAGS)

bin/juce_LocalisedStrings.o: src/juce_core/text/juce_LocalisedStrings.cpp
	$(CPP) -c src/juce_core/text/juce_LocalisedStrings.cpp -o bin/juce_LocalisedStrings.o $(CXXFLAGS)

bin/juce_PropertySet.o: src/juce_core/containers/juce_PropertySet.cpp
	$(CPP) -c src/juce_core/containers/juce_PropertySet.cpp -o bin/juce_PropertySet.o $(CXXFLAGS)

bin/juce_Drawable.o: src/juce_appframework/gui/graphics/drawables/juce_Drawable.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_Drawable.cpp -o bin/juce_Drawable.o $(CXXFLAGS)

bin/juce_DrawableComposite.o: src/juce_appframework/gui/graphics/drawables/juce_DrawableComposite.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_DrawableComposite.cpp -o bin/juce_DrawableComposite.o $(CXXFLAGS)

bin/juce_DrawableImage.o: src/juce_appframework/gui/graphics/drawables/juce_DrawableImage.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_DrawableImage.cpp -o bin/juce_DrawableImage.o $(CXXFLAGS)

bin/juce_DrawablePath.o: src/juce_appframework/gui/graphics/drawables/juce_DrawablePath.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_DrawablePath.cpp -o bin/juce_DrawablePath.o $(CXXFLAGS)

bin/juce_DrawableText.o: src/juce_appframework/gui/graphics/drawables/juce_DrawableText.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_DrawableText.cpp -o bin/juce_DrawableText.o $(CXXFLAGS)

bin/juce_ColourGradient.o: src/juce_appframework/gui/graphics/colour/juce_ColourGradient.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/colour/juce_ColourGradient.cpp -o bin/juce_ColourGradient.o $(CXXFLAGS)

bin/juce_ArrowButton.o: src/juce_appframework/gui/components/buttons/juce_ArrowButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_ArrowButton.cpp -o bin/juce_ArrowButton.o $(CXXFLAGS)

bin/juce_Button.o: src/juce_appframework/gui/components/buttons/juce_Button.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_Button.cpp -o bin/juce_Button.o $(CXXFLAGS)

bin/juce_DrawableButton.o: src/juce_appframework/gui/components/buttons/juce_DrawableButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_DrawableButton.cpp -o bin/juce_DrawableButton.o $(CXXFLAGS)

bin/juce_HyperlinkButton.o: src/juce_appframework/gui/components/buttons/juce_HyperlinkButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_HyperlinkButton.cpp -o bin/juce_HyperlinkButton.o $(CXXFLAGS)

bin/juce_ImageButton.o: src/juce_appframework/gui/components/buttons/juce_ImageButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_ImageButton.cpp -o bin/juce_ImageButton.o $(CXXFLAGS)

bin/juce_ShapeButton.o: src/juce_appframework/gui/components/buttons/juce_ShapeButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_ShapeButton.cpp -o bin/juce_ShapeButton.o $(CXXFLAGS)

bin/juce_TextButton.o: src/juce_appframework/gui/components/buttons/juce_TextButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_TextButton.cpp -o bin/juce_TextButton.o $(CXXFLAGS)

bin/juce_ToggleButton.o: src/juce_appframework/gui/components/buttons/juce_ToggleButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_ToggleButton.cpp -o bin/juce_ToggleButton.o $(CXXFLAGS)

bin/juce_ComboBox.o: src/juce_appframework/gui/components/controls/juce_ComboBox.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_ComboBox.cpp -o bin/juce_ComboBox.o $(CXXFLAGS)

bin/juce_Label.o: src/juce_appframework/gui/components/controls/juce_Label.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_Label.cpp -o bin/juce_Label.o $(CXXFLAGS)

bin/juce_ListBox.o: src/juce_appframework/gui/components/controls/juce_ListBox.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_ListBox.cpp -o bin/juce_ListBox.o $(CXXFLAGS)

bin/juce_ProgressBar.o: src/juce_appframework/gui/components/controls/juce_ProgressBar.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_ProgressBar.cpp -o bin/juce_ProgressBar.o $(CXXFLAGS)

bin/juce_Slider.o: src/juce_appframework/gui/components/controls/juce_Slider.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_Slider.cpp -o bin/juce_Slider.o $(CXXFLAGS)

bin/juce_TextEditor.o: src/juce_appframework/gui/components/controls/juce_TextEditor.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_TextEditor.cpp -o bin/juce_TextEditor.o $(CXXFLAGS)

bin/juce_TreeView.o: src/juce_appframework/gui/components/controls/juce_TreeView.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_TreeView.cpp -o bin/juce_TreeView.o $(CXXFLAGS)

bin/juce_KeyListener.o: src/juce_appframework/gui/components/keyboard/juce_KeyListener.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_KeyListener.cpp -o bin/juce_KeyListener.o $(CXXFLAGS)

bin/juce_KeyMappingEditorComponent.o: src/juce_appframework/gui/components/keyboard/juce_KeyMappingEditorComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_KeyMappingEditorComponent.cpp -o bin/juce_KeyMappingEditorComponent.o $(CXXFLAGS)

bin/juce_KeyPress.o: src/juce_appframework/gui/components/keyboard/juce_KeyPress.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_KeyPress.cpp -o bin/juce_KeyPress.o $(CXXFLAGS)

bin/juce_KeyPressMappingSet.o: src/juce_appframework/gui/components/keyboard/juce_KeyPressMappingSet.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_KeyPressMappingSet.cpp -o bin/juce_KeyPressMappingSet.o $(CXXFLAGS)

bin/juce_ModifierKeys.o: src/juce_appframework/gui/components/keyboard/juce_ModifierKeys.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_ModifierKeys.cpp -o bin/juce_ModifierKeys.o $(CXXFLAGS)

bin/juce_GroupComponent.o: src/juce_appframework/gui/components/layout/juce_GroupComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_GroupComponent.cpp -o bin/juce_GroupComponent.o $(CXXFLAGS)

bin/juce_ResizableBorderComponent.o: src/juce_appframework/gui/components/layout/juce_ResizableBorderComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ResizableBorderComponent.cpp -o bin/juce_ResizableBorderComponent.o $(CXXFLAGS)

bin/juce_ResizableCornerComponent.o: src/juce_appframework/gui/components/layout/juce_ResizableCornerComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ResizableCornerComponent.cpp -o bin/juce_ResizableCornerComponent.o $(CXXFLAGS)

bin/juce_ScrollBar.o: src/juce_appframework/gui/components/layout/juce_ScrollBar.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ScrollBar.cpp -o bin/juce_ScrollBar.o $(CXXFLAGS)

bin/juce_StretchableLayoutManager.o: src/juce_appframework/gui/components/layout/juce_StretchableLayoutManager.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_StretchableLayoutManager.cpp -o bin/juce_StretchableLayoutManager.o $(CXXFLAGS)

bin/juce_StretchableLayoutResizerBar.o: src/juce_appframework/gui/components/layout/juce_StretchableLayoutResizerBar.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_StretchableLayoutResizerBar.cpp -o bin/juce_StretchableLayoutResizerBar.o $(CXXFLAGS)

bin/juce_TabbedButtonBar.o: src/juce_appframework/gui/components/layout/juce_TabbedButtonBar.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_TabbedButtonBar.cpp -o bin/juce_TabbedButtonBar.o $(CXXFLAGS)

bin/juce_TabbedComponent.o: src/juce_appframework/gui/components/layout/juce_TabbedComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_TabbedComponent.cpp -o bin/juce_TabbedComponent.o $(CXXFLAGS)

bin/juce_Viewport.o: src/juce_appframework/gui/components/layout/juce_Viewport.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_Viewport.cpp -o bin/juce_Viewport.o $(CXXFLAGS)

bin/juce_LookAndFeel.o: src/juce_appframework/gui/components/lookandfeel/juce_LookAndFeel.cpp
	$(CPP) -c src/juce_appframework/gui/components/lookandfeel/juce_LookAndFeel.cpp -o bin/juce_LookAndFeel.o $(CXXFLAGS)

bin/juce_ShinyLookAndFeel.o: src/juce_appframework/gui/components/lookandfeel/juce_ShinyLookAndFeel.cpp
	$(CPP) -c src/juce_appframework/gui/components/lookandfeel/juce_ShinyLookAndFeel.cpp -o bin/juce_ShinyLookAndFeel.o $(CXXFLAGS)

bin/juce_PopupMenu.o: src/juce_appframework/gui/components/menus/juce_PopupMenu.cpp
	$(CPP) -c src/juce_appframework/gui/components/menus/juce_PopupMenu.cpp -o bin/juce_PopupMenu.o $(CXXFLAGS)

bin/juce_ComponentDragger.o: src/juce_appframework/gui/components/mouse/juce_ComponentDragger.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_ComponentDragger.cpp -o bin/juce_ComponentDragger.o $(CXXFLAGS)

bin/juce_DragAndDropContainer.o: src/juce_appframework/gui/components/mouse/juce_DragAndDropContainer.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_DragAndDropContainer.cpp -o bin/juce_DragAndDropContainer.o $(CXXFLAGS)

bin/juce_MouseCursor.o: src/juce_appframework/gui/components/mouse/juce_MouseCursor.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_MouseCursor.cpp -o bin/juce_MouseCursor.o $(CXXFLAGS)

bin/juce_MouseEvent.o: src/juce_appframework/gui/components/mouse/juce_MouseEvent.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_MouseEvent.cpp -o bin/juce_MouseEvent.o $(CXXFLAGS)

bin/juce_MouseHoverDetector.o: src/juce_appframework/gui/components/mouse/juce_MouseHoverDetector.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_MouseHoverDetector.cpp -o bin/juce_MouseHoverDetector.o $(CXXFLAGS)

bin/juce_MouseListener.o: src/juce_appframework/gui/components/mouse/juce_MouseListener.cpp
	$(CPP) -c src/juce_appframework/gui/components/mouse/juce_MouseListener.cpp -o bin/juce_MouseListener.o $(CXXFLAGS)

bin/juce_BubbleComponent.o: src/juce_appframework/gui/components/special/juce_BubbleComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_BubbleComponent.cpp -o bin/juce_BubbleComponent.o $(CXXFLAGS)

bin/juce_ColourSelector.o: src/juce_appframework/gui/components/special/juce_ColourSelector.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_ColourSelector.cpp -o bin/juce_ColourSelector.o $(CXXFLAGS)

bin/juce_DropShadower.o: src/juce_appframework/gui/components/special/juce_DropShadower.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_DropShadower.cpp -o bin/juce_DropShadower.o $(CXXFLAGS)

bin/juce_OpenGLComponent.o: src/juce_appframework/gui/components/special/juce_OpenGLComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_OpenGLComponent.cpp -o bin/juce_OpenGLComponent.o $(CXXFLAGS)

bin/juce_PreferencesPanel.o: src/juce_appframework/gui/components/special/juce_PreferencesPanel.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_PreferencesPanel.cpp -o bin/juce_PreferencesPanel.o $(CXXFLAGS)

bin/juce_QuickTimeMovieComponent.o: src/juce_appframework/gui/components/special/juce_QuickTimeMovieComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_QuickTimeMovieComponent.cpp -o bin/juce_QuickTimeMovieComponent.o $(CXXFLAGS)

bin/juce_AlertWindow.o: src/juce_appframework/gui/components/windows/juce_AlertWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_AlertWindow.cpp -o bin/juce_AlertWindow.o $(CXXFLAGS)

bin/juce_DialogWindow.o: src/juce_appframework/gui/components/windows/juce_DialogWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_DialogWindow.cpp -o bin/juce_DialogWindow.o $(CXXFLAGS)

bin/juce_ResizableWindow.o: src/juce_appframework/gui/components/windows/juce_ResizableWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_ResizableWindow.cpp -o bin/juce_ResizableWindow.o $(CXXFLAGS)

bin/juce_SplashScreen.o: src/juce_appframework/gui/components/windows/juce_SplashScreen.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_SplashScreen.cpp -o bin/juce_SplashScreen.o $(CXXFLAGS)

bin/juce_ThreadWithProgressWindow.o: src/juce_appframework/gui/components/windows/juce_ThreadWithProgressWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_ThreadWithProgressWindow.cpp -o bin/juce_ThreadWithProgressWindow.o $(CXXFLAGS)

bin/juce_ToolTipWindow.o: src/juce_appframework/gui/components/windows/juce_ToolTipWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_ToolTipWindow.cpp -o bin/juce_ToolTipWindow.o $(CXXFLAGS)

bin/juce_MenuBarComponent.o: src/juce_appframework/gui/components/menus/juce_MenuBarComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/menus/juce_MenuBarComponent.cpp -o bin/juce_MenuBarComponent.o $(CXXFLAGS)

bin/juce_BubbleMessageComponent.o: src/juce_appframework/gui/components/special/juce_BubbleMessageComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_BubbleMessageComponent.cpp -o bin/juce_BubbleMessageComponent.o $(CXXFLAGS)

bin/juce_Component.o: src/juce_appframework/gui/components/juce_Component.cpp
	$(CPP) -c src/juce_appframework/gui/components/juce_Component.cpp -o bin/juce_Component.o $(CXXFLAGS)

bin/juce_ComponentListener.o: src/juce_appframework/gui/components/juce_ComponentListener.cpp
	$(CPP) -c src/juce_appframework/gui/components/juce_ComponentListener.cpp -o bin/juce_ComponentListener.o $(CXXFLAGS)

bin/juce_Desktop.o: src/juce_appframework/gui/components/juce_Desktop.cpp
	$(CPP) -c src/juce_appframework/gui/components/juce_Desktop.cpp -o bin/juce_Desktop.o $(CXXFLAGS)

bin/juce_ToneGeneratorAudioSource.o: src/juce_appframework/audio/audio_sources/juce_ToneGeneratorAudioSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_ToneGeneratorAudioSource.cpp -o bin/juce_ToneGeneratorAudioSource.o $(CXXFLAGS)

bin/adler32.o: src/juce_core/io/streams/zlib/adler32.c
	$(CC) -c src/juce_core/io/streams/zlib/adler32.c -o bin/adler32.o $(CFLAGS)

bin/compress.o: src/juce_core/io/streams/zlib/compress.c
	$(CC) -c src/juce_core/io/streams/zlib/compress.c -o bin/compress.o $(CFLAGS)

bin/crc32.o: src/juce_core/io/streams/zlib/crc32.c
	$(CC) -c src/juce_core/io/streams/zlib/crc32.c -o bin/crc32.o $(CFLAGS)

bin/deflate.o: src/juce_core/io/streams/zlib/deflate.c
	$(CC) -c src/juce_core/io/streams/zlib/deflate.c -o bin/deflate.o $(CFLAGS)

bin/infback.o: src/juce_core/io/streams/zlib/infback.c
	$(CC) -c src/juce_core/io/streams/zlib/infback.c -o bin/infback.o $(CFLAGS)

bin/inffast.o: src/juce_core/io/streams/zlib/inffast.c
	$(CC) -c src/juce_core/io/streams/zlib/inffast.c -o bin/inffast.o $(CFLAGS)

bin/inflate.o: src/juce_core/io/streams/zlib/inflate.c
	$(CC) -c src/juce_core/io/streams/zlib/inflate.c -o bin/inflate.o $(CFLAGS)

bin/inftrees.o: src/juce_core/io/streams/zlib/inftrees.c
	$(CC) -c src/juce_core/io/streams/zlib/inftrees.c -o bin/inftrees.o $(CFLAGS)

bin/trees.o: src/juce_core/io/streams/zlib/trees.c
	$(CC) -c src/juce_core/io/streams/zlib/trees.c -o bin/trees.o $(CFLAGS)

bin/uncompr.o: src/juce_core/io/streams/zlib/uncompr.c
	$(CC) -c src/juce_core/io/streams/zlib/uncompr.c -o bin/uncompr.o $(CFLAGS)

bin/zutil.o: src/juce_core/io/streams/zlib/zutil.c
	$(CC) -c src/juce_core/io/streams/zlib/zutil.c -o bin/zutil.o $(CFLAGS)

bin/png.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/png.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/png.c -o bin/png.o $(CFLAGS)

bin/pngerror.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngerror.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngerror.c -o bin/pngerror.o $(CFLAGS)

bin/pnggccrd.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pnggccrd.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pnggccrd.c -o bin/pnggccrd.o $(CFLAGS)

bin/pngget.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngget.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngget.c -o bin/pngget.o $(CFLAGS)

bin/pngmem.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngmem.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngmem.c -o bin/pngmem.o $(CFLAGS)

bin/pngpread.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngpread.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngpread.c -o bin/pngpread.o $(CFLAGS)

bin/pngread.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngread.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngread.c -o bin/pngread.o $(CFLAGS)

bin/pngrio.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrio.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrio.c -o bin/pngrio.o $(CFLAGS)

bin/pngrtran.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrtran.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrtran.c -o bin/pngrtran.o $(CFLAGS)

bin/pngrutil.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrutil.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngrutil.c -o bin/pngrutil.o $(CFLAGS)

bin/pngset.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngset.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngset.c -o bin/pngset.o $(CFLAGS)

bin/pngtrans.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngtrans.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngtrans.c -o bin/pngtrans.o $(CFLAGS)

bin/pngvcrd.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngvcrd.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngvcrd.c -o bin/pngvcrd.o $(CFLAGS)

bin/pngwio.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwio.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwio.c -o bin/pngwio.o $(CFLAGS)

bin/pngwrite.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwrite.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwrite.c -o bin/pngwrite.o $(CFLAGS)

bin/pngwtran.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwtran.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwtran.c -o bin/pngwtran.o $(CFLAGS)

bin/pngwutil.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwutil.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib/pngwutil.c -o bin/pngwutil.o $(CFLAGS)

bin/jcapimin.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcapimin.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcapimin.c -o bin/jcapimin.o $(CFLAGS)

bin/jcapistd.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcapistd.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcapistd.c -o bin/jcapistd.o $(CFLAGS)

bin/jccoefct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jccoefct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jccoefct.c -o bin/jccoefct.o $(CFLAGS)

bin/jccolor.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jccolor.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jccolor.c -o bin/jccolor.o $(CFLAGS)

bin/jcdctmgr.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcdctmgr.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcdctmgr.c -o bin/jcdctmgr.o $(CFLAGS)

bin/jchuff.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jchuff.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jchuff.c -o bin/jchuff.o $(CFLAGS)

bin/jcinit.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcinit.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcinit.c -o bin/jcinit.o $(CFLAGS)

bin/jcmainct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmainct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmainct.c -o bin/jcmainct.o $(CFLAGS)

bin/jcmarker.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmarker.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmarker.c -o bin/jcmarker.o $(CFLAGS)

bin/jcmaster.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmaster.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcmaster.c -o bin/jcmaster.o $(CFLAGS)

bin/jcomapi.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcomapi.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcomapi.c -o bin/jcomapi.o $(CFLAGS)

bin/jcparam.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcparam.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcparam.c -o bin/jcparam.o $(CFLAGS)

bin/jcphuff.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcphuff.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcphuff.c -o bin/jcphuff.o $(CFLAGS)

bin/jcprepct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcprepct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcprepct.c -o bin/jcprepct.o $(CFLAGS)

bin/jcsample.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcsample.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jcsample.c -o bin/jcsample.o $(CFLAGS)

bin/jctrans.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jctrans.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jctrans.c -o bin/jctrans.o $(CFLAGS)

bin/jdapimin.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdapimin.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdapimin.c -o bin/jdapimin.o $(CFLAGS)

bin/jdapistd.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdapistd.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdapistd.c -o bin/jdapistd.o $(CFLAGS)

bin/jdatasrc.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdatasrc.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdatasrc.c -o bin/jdatasrc.o $(CFLAGS)

bin/jdcoefct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdcoefct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdcoefct.c -o bin/jdcoefct.o $(CFLAGS)

bin/jdcolor.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdcolor.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdcolor.c -o bin/jdcolor.o $(CFLAGS)

bin/jddctmgr.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jddctmgr.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jddctmgr.c -o bin/jddctmgr.o $(CFLAGS)

bin/jdhuff.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdhuff.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdhuff.c -o bin/jdhuff.o $(CFLAGS)

bin/jdinput.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdinput.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdinput.c -o bin/jdinput.o $(CFLAGS)

bin/jdmainct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmainct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmainct.c -o bin/jdmainct.o $(CFLAGS)

bin/jdmarker.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmarker.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmarker.c -o bin/jdmarker.o $(CFLAGS)

bin/jdmaster.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmaster.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmaster.c -o bin/jdmaster.o $(CFLAGS)

bin/jdmerge.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmerge.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdmerge.c -o bin/jdmerge.o $(CFLAGS)

bin/jdphuff.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdphuff.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdphuff.c -o bin/jdphuff.o $(CFLAGS)

bin/jdpostct.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdpostct.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdpostct.c -o bin/jdpostct.o $(CFLAGS)

bin/jdsample.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdsample.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdsample.c -o bin/jdsample.o $(CFLAGS)

bin/jdtrans.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdtrans.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jdtrans.c -o bin/jdtrans.o $(CFLAGS)

bin/jerror.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jerror.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jerror.c -o bin/jerror.o $(CFLAGS)

bin/jfdctflt.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctflt.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctflt.c -o bin/jfdctflt.o $(CFLAGS)

bin/jfdctfst.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctfst.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctfst.c -o bin/jfdctfst.o $(CFLAGS)

bin/jfdctint.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctint.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jfdctint.c -o bin/jfdctint.o $(CFLAGS)

bin/jidctflt.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctflt.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctflt.c -o bin/jidctflt.o $(CFLAGS)

bin/jidctfst.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctfst.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctfst.c -o bin/jidctfst.o $(CFLAGS)

bin/jidctint.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctint.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctint.c -o bin/jidctint.o $(CFLAGS)

bin/jidctred.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctred.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jidctred.c -o bin/jidctred.o $(CFLAGS)

bin/jmemmgr.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jmemmgr.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jmemmgr.c -o bin/jmemmgr.o $(CFLAGS)

bin/jmemnobs.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jmemnobs.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jmemnobs.c -o bin/jmemnobs.o $(CFLAGS)

bin/jquant1.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jquant1.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jquant1.c -o bin/jquant1.o $(CFLAGS)

bin/jquant2.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jquant2.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jquant2.c -o bin/jquant2.o $(CFLAGS)

bin/jutils.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jutils.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/jutils.c -o bin/jutils.o $(CFLAGS)

bin/transupp.o: src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/transupp.c
	$(CC) -c src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib/transupp.c -o bin/transupp.o $(CFLAGS)

bin/juce_MidiKeyboardComponent.o: src/juce_appframework/gui/components/special/juce_MidiKeyboardComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_MidiKeyboardComponent.cpp -o bin/juce_MidiKeyboardComponent.o $(CXXFLAGS)

bin/juce_AudioFormatManager.o: src/juce_appframework/audio/audio_file_formats/juce_AudioFormatManager.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_AudioFormatManager.cpp -o bin/juce_AudioFormatManager.o $(CXXFLAGS)

bin/juce_LowLevelGraphicsSoftwareRenderer.o: src/juce_appframework/gui/graphics/contexts/juce_LowLevelGraphicsSoftwareRenderer.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/contexts/juce_LowLevelGraphicsSoftwareRenderer.cpp -o bin/juce_LowLevelGraphicsSoftwareRenderer.o $(CXXFLAGS)

bin/juce_AudioDeviceManager.o: src/juce_appframework/audio/devices/juce_AudioDeviceManager.cpp
	$(CPP) -c src/juce_appframework/audio/devices/juce_AudioDeviceManager.cpp -o bin/juce_AudioDeviceManager.o $(CXXFLAGS)

bin/juce_AudioDeviceSelectorComponent.o: src/juce_appframework/gui/components/special/juce_AudioDeviceSelectorComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_AudioDeviceSelectorComponent.cpp -o bin/juce_AudioDeviceSelectorComponent.o $(CXXFLAGS)

bin/juce_DocumentWindow.o: src/juce_appframework/gui/components/windows/juce_DocumentWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_DocumentWindow.cpp -o bin/juce_DocumentWindow.o $(CXXFLAGS)

bin/juce_ComponentBoundsConstrainer.o: src/juce_appframework/gui/components/layout/juce_ComponentBoundsConstrainer.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ComponentBoundsConstrainer.cpp -o bin/juce_ComponentBoundsConstrainer.o $(CXXFLAGS)

bin/juce_MidiBuffer.o: src/juce_appframework/audio/midi/juce_MidiBuffer.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiBuffer.cpp -o bin/juce_MidiBuffer.o $(CXXFLAGS)

bin/juce_MidiFile.o: src/juce_appframework/audio/midi/juce_MidiFile.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiFile.cpp -o bin/juce_MidiFile.o $(CXXFLAGS)

bin/juce_MidiKeyboardState.o: src/juce_appframework/audio/midi/juce_MidiKeyboardState.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiKeyboardState.cpp -o bin/juce_MidiKeyboardState.o $(CXXFLAGS)

bin/juce_MidiMessage.o: src/juce_appframework/audio/midi/juce_MidiMessage.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiMessage.cpp -o bin/juce_MidiMessage.o $(CXXFLAGS)

bin/juce_MidiMessageCollector.o: src/juce_appframework/audio/midi/juce_MidiMessageCollector.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiMessageCollector.cpp -o bin/juce_MidiMessageCollector.o $(CXXFLAGS)

bin/juce_MidiMessageSequence.o: src/juce_appframework/audio/midi/juce_MidiMessageSequence.cpp
	$(CPP) -c src/juce_appframework/audio/midi/juce_MidiMessageSequence.cpp -o bin/juce_MidiMessageSequence.o $(CXXFLAGS)

bin/juce_TopLevelWindow.o: src/juce_appframework/gui/components/windows/juce_TopLevelWindow.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_TopLevelWindow.cpp -o bin/juce_TopLevelWindow.o $(CXXFLAGS)

bin/juce_ComponentPeer.o: src/juce_appframework/gui/components/windows/juce_ComponentPeer.cpp
	$(CPP) -c src/juce_appframework/gui/components/windows/juce_ComponentPeer.cpp -o bin/juce_ComponentPeer.o $(CXXFLAGS)

bin/juce_BorderSize.o: src/juce_appframework/gui/graphics/geometry/juce_BorderSize.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_BorderSize.cpp -o bin/juce_BorderSize.o $(CXXFLAGS)

bin/juce_PropertiesFile.o: src/juce_appframework/application/juce_PropertiesFile.cpp
	$(CPP) -c src/juce_appframework/application/juce_PropertiesFile.cpp -o bin/juce_PropertiesFile.o $(CXXFLAGS)

bin/juce_FileBasedDocument.o: src/juce_appframework/documents/juce_FileBasedDocument.cpp
	$(CPP) -c src/juce_appframework/documents/juce_FileBasedDocument.cpp -o bin/juce_FileBasedDocument.o $(CXXFLAGS)

bin/juce_RecentlyOpenedFilesList.o: src/juce_appframework/documents/juce_RecentlyOpenedFilesList.cpp
	$(CPP) -c src/juce_appframework/documents/juce_RecentlyOpenedFilesList.cpp -o bin/juce_RecentlyOpenedFilesList.o $(CXXFLAGS)

bin/juce_UndoManager.o: src/juce_appframework/documents/juce_UndoManager.cpp
	$(CPP) -c src/juce_appframework/documents/juce_UndoManager.cpp -o bin/juce_UndoManager.o $(CXXFLAGS)

bin/juce_DirectoryContentsList.o: src/juce_appframework/gui/components/filebrowser/juce_DirectoryContentsList.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_DirectoryContentsList.cpp -o bin/juce_DirectoryContentsList.o $(CXXFLAGS)

bin/juce_FileBrowserComponent.o: src/juce_appframework/gui/components/filebrowser/juce_FileBrowserComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FileBrowserComponent.cpp -o bin/juce_FileBrowserComponent.o $(CXXFLAGS)

bin/juce_FileChooser.o: src/juce_appframework/gui/components/filebrowser/juce_FileChooser.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FileChooser.cpp -o bin/juce_FileChooser.o $(CXXFLAGS)

bin/juce_FileChooserDialogBox.o: src/juce_appframework/gui/components/filebrowser/juce_FileChooserDialogBox.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FileChooserDialogBox.cpp -o bin/juce_FileChooserDialogBox.o $(CXXFLAGS)

bin/juce_FileFilter.o: src/juce_appframework/gui/components/filebrowser/juce_FileFilter.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FileFilter.cpp -o bin/juce_FileFilter.o $(CXXFLAGS)

bin/juce_FileListComponent.o: src/juce_appframework/gui/components/filebrowser/juce_FileListComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FileListComponent.cpp -o bin/juce_FileListComponent.o $(CXXFLAGS)

bin/juce_ImagePreviewComponent.o: src/juce_appframework/gui/components/filebrowser/juce_ImagePreviewComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_ImagePreviewComponent.cpp -o bin/juce_ImagePreviewComponent.o $(CXXFLAGS)

bin/juce_WildcardFileFilter.o: src/juce_appframework/gui/components/filebrowser/juce_WildcardFileFilter.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_WildcardFileFilter.cpp -o bin/juce_WildcardFileFilter.o $(CXXFLAGS)

bin/juce_AudioIODevice.o: src/juce_appframework/audio/devices/juce_AudioIODevice.cpp
	$(CPP) -c src/juce_appframework/audio/devices/juce_AudioIODevice.cpp -o bin/juce_AudioIODevice.o $(CXXFLAGS)

bin/juce_AudioIODeviceType.o: src/juce_appframework/audio/devices/juce_AudioIODeviceType.cpp
	$(CPP) -c src/juce_appframework/audio/devices/juce_AudioIODeviceType.cpp -o bin/juce_AudioIODeviceType.o $(CXXFLAGS)

bin/juce_Socket.o: src/juce_core/io/network/juce_Socket.cpp
	$(CPP) -c src/juce_core/io/network/juce_Socket.cpp -o bin/juce_Socket.o $(CXXFLAGS)

bin/juce_NamedPipe.o: src/juce_core/io/files/juce_NamedPipe.cpp
	$(CPP) -c src/juce_core/io/files/juce_NamedPipe.cpp -o bin/juce_NamedPipe.o $(CXXFLAGS)

bin/juce_InterprocessConnection.o: src/juce_appframework/events/juce_InterprocessConnection.cpp
	$(CPP) -c src/juce_appframework/events/juce_InterprocessConnection.cpp -o bin/juce_InterprocessConnection.o $(CXXFLAGS)

bin/juce_InterprocessConnectionServer.o: src/juce_appframework/events/juce_InterprocessConnectionServer.cpp
	$(CPP) -c src/juce_appframework/events/juce_InterprocessConnectionServer.cpp -o bin/juce_InterprocessConnectionServer.o $(CXXFLAGS)

bin/juce_FlacAudioFormat.o: src/juce_appframework/audio/audio_file_formats/juce_FlacAudioFormat.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_FlacAudioFormat.cpp -o bin/juce_FlacAudioFormat.o $(CXXFLAGS)

bin/juce_OggVorbisAudioFormat.o: src/juce_appframework/audio/audio_file_formats/juce_OggVorbisAudioFormat.cpp
	$(CPP) -c src/juce_appframework/audio/audio_file_formats/juce_OggVorbisAudioFormat.cpp -o bin/juce_OggVorbisAudioFormat.o $(CXXFLAGS)

bin/juce_ApplicationCommandInfo.o: src/juce_appframework/application/juce_ApplicationCommandInfo.cpp
	$(CPP) -c src/juce_appframework/application/juce_ApplicationCommandInfo.cpp -o bin/juce_ApplicationCommandInfo.o $(CXXFLAGS)

bin/juce_ApplicationCommandManager.o: src/juce_appframework/application/juce_ApplicationCommandManager.cpp
	$(CPP) -c src/juce_appframework/application/juce_ApplicationCommandManager.cpp -o bin/juce_ApplicationCommandManager.o $(CXXFLAGS)

bin/juce_ApplicationCommandTarget.o: src/juce_appframework/application/juce_ApplicationCommandTarget.cpp
	$(CPP) -c src/juce_appframework/application/juce_ApplicationCommandTarget.cpp -o bin/juce_ApplicationCommandTarget.o $(CXXFLAGS)

bin/juce_PositionedRectangle.o: src/juce_appframework/gui/graphics/geometry/juce_PositionedRectangle.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/geometry/juce_PositionedRectangle.cpp -o bin/juce_PositionedRectangle.o $(CXXFLAGS)

bin/juce_MultiDocumentPanel.o: src/juce_appframework/gui/components/layout/juce_MultiDocumentPanel.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_MultiDocumentPanel.cpp -o bin/juce_MultiDocumentPanel.o $(CXXFLAGS)

bin/juce_ButtonPropertyComponent.o: src/juce_appframework/gui/components/properties/juce_ButtonPropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_ButtonPropertyComponent.cpp -o bin/juce_ButtonPropertyComponent.o $(CXXFLAGS)

bin/juce_ChoicePropertyComponent.o: src/juce_appframework/gui/components/properties/juce_ChoicePropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_ChoicePropertyComponent.cpp -o bin/juce_ChoicePropertyComponent.o $(CXXFLAGS)

bin/juce_PropertyComponent.o: src/juce_appframework/gui/components/properties/juce_PropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_PropertyComponent.cpp -o bin/juce_PropertyComponent.o $(CXXFLAGS)

bin/juce_PropertyPanel.o: src/juce_appframework/gui/components/properties/juce_PropertyPanel.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_PropertyPanel.cpp -o bin/juce_PropertyPanel.o $(CXXFLAGS)

bin/juce_SliderPropertyComponent.o: src/juce_appframework/gui/components/properties/juce_SliderPropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_SliderPropertyComponent.cpp -o bin/juce_SliderPropertyComponent.o $(CXXFLAGS)

bin/juce_TextPropertyComponent.o: src/juce_appframework/gui/components/properties/juce_TextPropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_TextPropertyComponent.cpp -o bin/juce_TextPropertyComponent.o $(CXXFLAGS)

bin/juce_MagnifierComponent.o: src/juce_appframework/gui/components/special/juce_MagnifierComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_MagnifierComponent.cpp -o bin/juce_MagnifierComponent.o $(CXXFLAGS)

bin/juce_FilenameComponent.o: src/juce_appframework/gui/components/filebrowser/juce_FilenameComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/filebrowser/juce_FilenameComponent.cpp -o bin/juce_FilenameComponent.o $(CXXFLAGS)

bin/juce_KeyboardFocusTraverser.o: src/juce_appframework/gui/components/keyboard/juce_KeyboardFocusTraverser.cpp
	$(CPP) -c src/juce_appframework/gui/components/keyboard/juce_KeyboardFocusTraverser.cpp -o bin/juce_KeyboardFocusTraverser.o $(CXXFLAGS)

bin/juce_BooleanPropertyComponent.o: src/juce_appframework/gui/components/properties/juce_BooleanPropertyComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/properties/juce_BooleanPropertyComponent.cpp -o bin/juce_BooleanPropertyComponent.o $(CXXFLAGS)

bin/juce_CharacterFunctions.o: src/juce_core/text/juce_CharacterFunctions.cpp
	$(CPP) -c src/juce_core/text/juce_CharacterFunctions.cpp -o bin/juce_CharacterFunctions.o $(CXXFLAGS)

bin/juce_SVGParser.o: src/juce_appframework/gui/graphics/drawables/juce_SVGParser.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/drawables/juce_SVGParser.cpp -o bin/juce_SVGParser.o $(CXXFLAGS)

bin/juce_RectanglePlacement.o: src/juce_appframework/gui/graphics/contexts/juce_RectanglePlacement.cpp
	$(CPP) -c src/juce_appframework/gui/graphics/contexts/juce_RectanglePlacement.cpp -o bin/juce_RectanglePlacement.o $(CXXFLAGS)

bin/juce_TableHeaderComponent.o: src/juce_appframework/gui/components/controls/juce_TableHeaderComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_TableHeaderComponent.cpp -o bin/juce_TableHeaderComponent.o $(CXXFLAGS)

bin/juce_TableListBox.o: src/juce_appframework/gui/components/controls/juce_TableListBox.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_TableListBox.cpp -o bin/juce_TableListBox.o $(CXXFLAGS)

bin/juce_StretchableObjectResizer.o: src/juce_appframework/gui/components/layout/juce_StretchableObjectResizer.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_StretchableObjectResizer.cpp -o bin/juce_StretchableObjectResizer.o $(CXXFLAGS)

bin/juce_Toolbar.o: src/juce_appframework/gui/components/controls/juce_Toolbar.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_Toolbar.cpp -o bin/juce_Toolbar.o $(CXXFLAGS)

bin/juce_ToolbarItemComponent.o: src/juce_appframework/gui/components/controls/juce_ToolbarItemComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_ToolbarItemComponent.cpp -o bin/juce_ToolbarItemComponent.o $(CXXFLAGS)

bin/juce_ToolbarItemPalette.o: src/juce_appframework/gui/components/controls/juce_ToolbarItemPalette.cpp
	$(CPP) -c src/juce_appframework/gui/components/controls/juce_ToolbarItemPalette.cpp -o bin/juce_ToolbarItemPalette.o $(CXXFLAGS)

bin/juce_ComponentAnimator.o: src/juce_appframework/gui/components/layout/juce_ComponentAnimator.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ComponentAnimator.cpp -o bin/juce_ComponentAnimator.o $(CXXFLAGS)

bin/juce_MultiTimer.o: src/juce_appframework/events/juce_MultiTimer.cpp
	$(CPP) -c src/juce_appframework/events/juce_MultiTimer.cpp -o bin/juce_MultiTimer.o $(CXXFLAGS)

bin/juce_ToolbarButton.o: src/juce_appframework/gui/components/buttons/juce_ToolbarButton.cpp
	$(CPP) -c src/juce_appframework/gui/components/buttons/juce_ToolbarButton.cpp -o bin/juce_ToolbarButton.o $(CXXFLAGS)

bin/juce_Sampler.o: src/juce_appframework/audio/synthesisers/juce_Sampler.cpp
	$(CPP) -c src/juce_appframework/audio/synthesisers/juce_Sampler.cpp -o bin/juce_Sampler.o $(CXXFLAGS)

bin/juce_Synthesiser.o: src/juce_appframework/audio/synthesisers/juce_Synthesiser.cpp
	$(CPP) -c src/juce_appframework/audio/synthesisers/juce_Synthesiser.cpp -o bin/juce_Synthesiser.o $(CXXFLAGS)

bin/juce_ComponentMovementWatcher.o: src/juce_appframework/gui/components/layout/juce_ComponentMovementWatcher.cpp
	$(CPP) -c src/juce_appframework/gui/components/layout/juce_ComponentMovementWatcher.cpp -o bin/juce_ComponentMovementWatcher.o $(CXXFLAGS)

bin/juce_AudioDataConverters.o: src/juce_appframework/audio/dsp/juce_AudioDataConverters.cpp
	$(CPP) -c src/juce_appframework/audio/dsp/juce_AudioDataConverters.cpp -o bin/juce_AudioDataConverters.o $(CXXFLAGS)

bin/juce_AudioSampleBuffer.o: src/juce_appframework/audio/dsp/juce_AudioSampleBuffer.cpp
	$(CPP) -c src/juce_appframework/audio/dsp/juce_AudioSampleBuffer.cpp -o bin/juce_AudioSampleBuffer.o $(CXXFLAGS)

bin/juce_IIRFilter.o: src/juce_appframework/audio/dsp/juce_IIRFilter.cpp
	$(CPP) -c src/juce_appframework/audio/dsp/juce_IIRFilter.cpp -o bin/juce_IIRFilter.o $(CXXFLAGS)

bin/juce_ApplicationProperties.o: src/juce_appframework/application/juce_ApplicationProperties.cpp
	$(CPP) -c src/juce_appframework/application/juce_ApplicationProperties.cpp -o bin/juce_ApplicationProperties.o $(CXXFLAGS)

bin/juce_SystemTrayIconComponent.o: src/juce_appframework/gui/components/special/juce_SystemTrayIconComponent.cpp
	$(CPP) -c src/juce_appframework/gui/components/special/juce_SystemTrayIconComponent.cpp -o bin/juce_SystemTrayIconComponent.o $(CXXFLAGS)

bin/juce_MenuBarModel.o: src/juce_appframework/gui/components/menus/juce_MenuBarModel.cpp
	$(CPP) -c src/juce_appframework/gui/components/menus/juce_MenuBarModel.cpp -o bin/juce_MenuBarModel.o $(CXXFLAGS)

bin/juce_ChannelRemappingAudioSource.o: src/juce_appframework/audio/audio_sources/juce_ChannelRemappingAudioSource.cpp
	$(CPP) -c src/juce_appframework/audio/audio_sources/juce_ChannelRemappingAudioSource.cpp -o bin/juce_ChannelRemappingAudioSource.o $(CXXFLAGS)
