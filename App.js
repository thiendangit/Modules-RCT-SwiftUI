/**
 * Sample React Native App
 */

import React, {useEffect, useState} from 'react';
import {
    requireNativeComponent,
    Platform,
    NativeModules,
    NativeAppEventEmitter,
    View
} from 'react-native';

const SwiftUIButton = requireNativeComponent('SwiftUIButton');

const App = () => {
    const [count, updateCount] = useState(0);

    useEffect(() => {
        console.log('NativeModules: ', NativeModules);
        NativeModules.SwiftReturnName.getName();
        NativeModules.SwiftReturnName.increase();
        NativeModules.SwiftReturnName.getCount((e) => console.log({e}));
        NativeAppEventEmitter.addListener('onCountChange', (e: Event) => {
            updateCount(e.count);
        });
        decrement().then(r => console.log({r}))
    }, []);

    async function decrement() {
        try {
            const res = await NativeModules.Counter.decrement();
            console.log(res);
            return res
        } catch (e) {
            console.log(e.message, e.code);
            return e
        }
    }

    return (
        <SwiftUIButton
            style={styles.container}
            count={count}
            color="yellow"
            onCountChange={e => {
                // updateCount(e.nativeEvent.count);
            }}
        />
    );
};

const styles = {
    container: {
        flex: 1,
        // alignItems: 'center',
        justifyContent: 'center',
    },
};

export default App;
