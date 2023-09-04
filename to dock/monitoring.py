import sys
from opcua import Client
from opcua import ua
from time import sleep
from flask import Flask

sys.path.insert(0, "..")

client = Client("opc.tcp://192.168.250.120:4840")

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get():
    return {'hello':'world'}

@app.route('/getHomeData', methods=['GET'])
def getHomeData():
    return {'hello':'world'}

@app.route('/getMaintenanceData', methods=['GET'])
def getMaintenanceData():
    return {'hello':'world'}

@app.route('/getSettingsData', methods=['GET'])
def getSettingsData():
    return {'hello':'world'}

@app.route('/getNotiData', methods=['GET'])
def getNotiData():
    return {'hello':'world'}

@app.route('/getOffsetData', methods=['GET'])
def getOffsetData():
    return {'hello':'world'}

@app.route('/getMonitorData', methods=['GET'])
def getMonitorData():
    
    client.connect()

    # Water Percentage data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_WaterSaline")
    water_percent = var.get_value()
    print("Water Percentage = " + str(water_percent) + "%")
    
    # Salt Percentage data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_SaltSaline")
    salt_percent = var.get_value()
    print("Salt Percentage = " + str(salt_percent) + "%")
    
    # Current Saline Produced data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_CSalineProd")
    cSalineProd = var.get_value()
    print("Current Saline Produced = " + str(cSalineProd))
    
    # Average Saline Produced data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_ASalineProd")
    aSalineProd = var.get_value()
    print("Average Saline Produced = " + str(aSalineProd))

    # Total Saline Produced data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_TSalineProd")
    tSalineProd = var.get_value()
    print("Total Saline Produced = " + str(tSalineProd))
    
    # Batch completion percentage data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_BatchPercentage")
    batch_percent = var.get_value()
    print("Batch Completion = " + str(batch_percent) + "%")
    
    # Salt amount data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_SaltResource")
    salt_resource = var.get_value()
    print("Amount of Salt left = " + str(salt_resource) + "%")
    
    # Water amount data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_WaterResource")
    water_resource = var.get_value()
    print("Amount of Water left = " + str(water_resource) + "%")
    
    # Bottle amount data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_BottleResource")
    bottle_resource = var.get_value()
    print("Amount of Bottles left = " + str(bottle_resource) + "%")
    
    # Energy consumption data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_EnergyConsume")
    energy_consume = var.get_value()
    print("Energy Consumption = " + str(energy_consume) + "%")
        
    return {
        "water_percent": water_percent,
        "salt_percent": salt_percent,
        "cSalineProd": cSalineProd,
        "aSalineProd": aSalineProd,
        "tSalineProd": tSalineProd,
        "batch_percent": batch_percent,
        "salt_resource": salt_resource,
        "water_resource": water_resource,
        "bottle_resource": bottle_resource,
        "energy_consume": energy_consume,
    }


@app.route('/getControlsData', methods=['GET'])
def getControlsData():
    #client = Client("opc.tcp://admin@192.168.2.1:4840") #connect using a user
    client.connect()

    # Get UA nodes in root
    # root = client.get_root_node()

    # Water Valve data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_WaterValve")
    water_valve = var.get_value()
    print("Water Valve = " + str(water_valve))
    
    # Salt Valve data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_SaltValve")
    salt_valve = var.get_value()
    print("Salt Water Valve = " + str(salt_valve))
    
    # Electricity data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_Electricity")
    electricity = var.get_value()
    print("Electricity Output = " + str(electricity))
    
    # Temperature data
    var = client.get_node("ns=4;s=|var|Turck/ARM/WinCE TV.Application.GVL_Virtual_Tags.S_Temperature")
    temperature = var.get_value()
    print("Temperature = " + str(temperature))
    
    return {
        "water_valve":water_valve,
        "salt_valve":salt_valve,
        "electricity":electricity,
        "temperature":temperature,
    }

if __name__ == "__main__":
    app.run(debug=True) 
