import React from 'react';
import { SafeAreaView, Text, Button } from 'react-native';
import ZipArchive from 'turbo-zip-archive';
import RNFetchBlob from 'rn-fetch-blob';

const App = () => {
  const dirs = RNFetchBlob.fs.dirs;
  const fromPath = dirs.DocumentDir + '/artifacts.zip';

  const unzipNowTurbo = () => {};

  return (
    <SafeAreaView>
      <Text>{ZipArchive.getGreeting('Roshan')}</Text>
      <Button title="Unzip Turbo" onPress={unzipNowTurbo} />
    </SafeAreaView>
  );
};

export default App;
