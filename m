Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F342E7F3E
	for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272136; cv=none; b=qTZfSsbnHt0Bv5GHGtl65k84QbqzuiDhiDgoLCfKtk9hSFkFmJ8uCF/cbDh++CZPIDmiqG581uZ2Yi2McVUpmoAe4xfuicDEGeYW8JDoQeA9OSY9DSmeeXby5OQTlieVocqpdi13YBgAHw6PQd6Sa7KW3SFFtt2aG2l0EwwOdks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272136; c=relaxed/simple;
	bh=hiOFNQ17ERVKbfebChqsUlX1uHqia7AnqNZGUpzdbjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IthMnmVgdMXYVTfZTqKcSLadiCa7kLu7Z02pX5RPKwRxF/18374OKz4sbBxwYb1B9iHWzkXD8bDFL3ZGhwPzY34wCyPhJgFddhbkFyBXu+m6ToA/sl4VDg/ejcttalfLGOx5WwJ2u/OY7/aURBKUu3+pdExj5Ch5LI2zwG6SWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rmx4fKW8; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rmx4fKW8"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ae61424095so7050962eec.1
        for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 18:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768272134; x=1768876934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta0lLAJ+DUwOWY7C9ZVK7vK19fEvpHZQw6/OXGKH8sQ=;
        b=Rmx4fKW8DJ3cYN0KUrg7t7Q7qW87Jtdo4V/5RErE2ETfM+m58wlCNn6oefjRyBoJWB
         VigQZL3L95f/FD+Yl6o6hyw+c2R3mMWRe45Z6rUe/pqxr5ElqGWQftTNcQ+jhVaeg+/d
         bfKKWlmmu9v47i3PvDKbW8S66FS3jBxptDahD9HBspP/1eN4+ftW4CSpiOACzb9Oaynv
         Q89u5u1swWfY9GkQYmDUb6pncFRlKU5Y9zSsHKyz2VhM/vlfets7YFtuo87dknpC0UlD
         K3+8bklJtjMNrApWrZ5uhdWtwgRtEkXUXU3DPIE8NXDeTuKDCaB93L62m7OeWwt71oWZ
         /+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272134; x=1768876934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ta0lLAJ+DUwOWY7C9ZVK7vK19fEvpHZQw6/OXGKH8sQ=;
        b=dumMuk+hFAeVtbAPxZm4zU3c8FDMJ1QHx+pBOH4ffQpf/ixV0MahxKH8r+e8haez2G
         1VJdMWcVcmuKPhRyV7WhtAUY1B/T/7nLuRVWnmxJj6kM5rqP6I9r+1lqwSg6s7V3jAbu
         wjOy4XKwYZXawcDi9N6yhvy7s9jjdW08d5eCtMhi830nOoJsQWzXx8wkYhv8MzfOSumn
         xPxBerr76SuxCnAP+fwnAzD4VY1VotlzC8XlO1MKzaHQDpdzkAPpFfFrmzIgh84LLEVP
         tN7QocGk0sM653wkblDUf8W7z1+/TIsKN05hOUmlnMac3FoNGjt5GIhg8IQXPzsgvnrd
         upPg==
X-Forwarded-Encrypted: i=1; AJvYcCXjjFZHeA12osaxYv4eSrZindqGhfpdS98WZZZtceHvYERSJ1zyOMxA7nb25uGWenJxi2HZE/4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ9AernBhXYhnhPHRd1ZTE90k2KkZIidfYpabdG8YPk9XrQ9Wb
	booL8DeQlNJRzH5daLIXWWGmGfSdenq5eBGfql6ujBHvsB6O4UC7iNKc
X-Gm-Gg: AY/fxX6NU6uvTCOhZ4lqnPv65igUgcvFh2wjqr36SKf7Gv3f9onbanvWcM/CE+IsCdS
	ggAq48KypHDDPQbEvvHyZOZAEQeixP2iVX78EaogJZvFpRcgeQAigQTSdLOMXwPg3Bc+wPdURes
	6S0Tpmr+jHqDbM3YneUyYue3MO7tdnqULFfdvTQPQAC08/L1teYzCHhCDg3dXKVOqyi+slJD0UX
	huIlO3XfjtaZIYB+d6twWcuG9RYGRT+dfhVHmEkoXTvJtAQgpqgvM5X3lrCVIShiyDYsuCRo0bf
	r6oUg5JiQbZ4ZT3o+gnln9wmAVPCtKegNSyms6Kxyyo5sATbkuKndToa8JpoCFlM+R/DF6V+TeE
	S/uX+lvbop9U/5rZGqX/6b86wZM8f0ywwuYVQz0+Pdm7YwnPj7ShtbOheT7Db9iLmxPOV5SIsbe
	sRW2+6TL9hhw==
X-Google-Smtp-Source: AGHT+IH4Km9ntJv/V5juZZRPb4CWcmWHAyBALsS6npHeTLuLmd+WrofVWrZd4uuaYzWfcyskRChBgQ==
X-Received: by 2002:a05:7022:43a0:b0:119:e569:f609 with SMTP id a92af1059eb24-121f8afbcfemr17090235c88.2.1768272134480;
        Mon, 12 Jan 2026 18:42:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm26993899c88.5.2026.01.12.18.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:42:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
Date: Tue, 13 Jan 2026 10:38:27 +0800
Message-ID: <20260113023828.790136-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sg2042.dtsi, some peripheral device node does not follow the
address order. Reorder them in ascending order by address.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 176 ++++++++++++-------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e6891f95d479..9fddf3f0b3b9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -264,94 +264,6 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
-		pcie_rc0: pcie@7060000000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x60000000  0x0 0x00800000>,
-			      <0x40 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
-				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc1: pcie@7060800000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x60800000  0x0 0x00800000>,
-			      <0x44 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <1>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
-				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc2: pcie@7062000000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x62000000  0x0 0x00800000>,
-			      <0x48 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <2>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
-				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
-				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc3: pcie@7062800000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x62800000  0x0 0x00800000>,
-			      <0x4c 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <3>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
-				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
-				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
 		rstgen: reset-controller@7030013000 {
 			compatible = "sophgo,sg2042-reset";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
@@ -486,5 +398,93 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x00800000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc1: pcie@7060800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60800000  0x0 0x00800000>,
+			      <0x44 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc3: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <3>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.52.0

