import 'package:flutter/material.dart';
import 'package:good_shoes/user_data.dart';
// If you want these categories to open your BrandProductsPage, import it here:
// import 'package:good_shoes/brand_products.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // =================================================
          // DRAWER HEADER (User Data)
          // =================================================
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.black54,
              ),
            ),
            
            // Fetching First & Last Name from user_data.dart
            accountName: Text(
              UserData.firstName.isEmpty 
                  ? "Welcome, User" 
                  : "${UserData.firstName} ${UserData.lastName}",
              style: const TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            
            // Fetching Email from user_data.dart
            accountEmail: Text(
              UserData.email.isEmpty ? "No email provided" : UserData.email,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ),

          // =================================================
          // DRAWER ITEMS (Shoe Categories)
          // =================================================
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _drawerItem(
                  context,
                  title: "Men's Shoes",
                  icon: Icons.man,
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                    
                    // TODO: Add your navigation logic here. Example:
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const BrandProductsPage(brand: "Men")));
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Men's Shoes coming soon!")),
                    );
                  },
                ),
                
                _drawerItem(
                  context,
                  title: "Women's Shoes",
                  icon: Icons.woman,
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                    
                    // TODO: Add your navigation logic here.
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Women's Shoes coming soon!")),
                    );
                  },
                ),
                
                _drawerItem(
                  context,
                  title: "Kids' Shoes",
                  icon: Icons.child_care,
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                    
                    // TODO: Add your navigation logic here.
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Kids' Shoes coming soon!")),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // REUSABLE TILE BUILDER
  // =====================================================
  Widget _drawerItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios, 
        size: 14, 
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}