import React from 'react';
import { SafeAreaView, Text, Button } from 'react-native';
import ZipArchive from 'turbo-zip-archive';
import RNFetchBlob from 'rn-fetch-blob';

const App = () => {
  const dirs = RNFetchBlob.fs.dirs;
  const fromPath = dirs.DocumentDir + '/artifacts.zip';

  return (
    <SafeAreaView>
      <Text>{ZipArchive.getGreeting('Roshan')}</Text>
      <Button
        title="Unzip"
        onPress={() => ZipArchive.unzip(fromPath, dirs.DocumentDir, 'UTF-8')}
      />
    </SafeAreaView>
  );
};

export default App;
