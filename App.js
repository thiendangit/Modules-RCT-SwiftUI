/**
 * Sample React Native App
 */

import React, {useEffect, useState} from 'react';
import {
    requireNativeComponent,
    Platform,
    NativeModules,
    NativeAppEventEmitter,
    View, TouchableOpacity, Text, ActivityIndicator, Dimensions
} from 'react-native';
// import {RNPaypal} from "react-native-paytest"

// const SwiftUIButton = requireNativeComponent('SwiftUIButton')
const {RNPaypal} = NativeModules;

const App = () => {
    const [count, updateCount] = useState(0);
    const [spinner, setSpinner] = useState(false);

    useEffect(() => {
        console.log({RNPaypal});
        NativeModules.SwiftReturnName.getName();
        NativeModules.SwiftReturnName.increase();
        NativeModules.SwiftReturnName.getCount((e) => console.log({e}));
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

    async function requestOneTimePayment() {
        setSpinner(true);
        await RNPaypal.requestOneTimePayment('', {}).then(result => {
            if(!result){
                alert('Huỷ bỏ!')
            }else {
                console.log({result});
                alert(`Thanh toán thành công với payerId : ${result.payerId}!`)
            }
        });
        setSpinner(false)
    }

    return (
        <View style={{flex: 1, justifyContent: 'center'}}>
            <TouchableOpacity style={{
                backgroundColor: 'red', height: 50, width: 200,
                alignItems: 'center', justifyContent: 'center', alignSelf: 'center',
                borderRadius: 30
            }} activeOpacity={.9} onPress={() => {
                requestOneTimePayment().then(result => '')
            }}>
                <Text style={{textAlign: 'center',}}>
                    Pay
                </Text>
            </TouchableOpacity>
            {spinner === true &&
            <View style={{
                flex: 1,
                justifyContent: "center",
                height: Dimensions.get('window').height,
                width: Dimensions.get('window').width,
                backgroundColor: 'transparent',
                position: 'absolute',
                left: 0,
                alignItems: 'center',
            }}>
                <ActivityIndicator size="large" color="black"/>
            </View>
            }
        </View>
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
