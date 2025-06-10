Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD82F26560C;
	Tue, 10 Jun 2025 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586368; cv=none; b=ebvH2lmYVM2TZEm3IKe0NeUhYGDx6LT+03MW9fAJNZEPgJNDMNLThLiHM79m0dflAwETqj16RbmQRNj2PNOaAzwo78jLCM85jwgPoiVPYjddxTJzhJ3sdr7WItfvw6Mgkdf3/YX5WtzymmwiVJBWrqFwzaWnbcrp81AwDdr5rqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586368; c=relaxed/simple;
	bh=Zj0DJQ2LjvR8RfDcz/aUcqwlhsfxsaWb2eD9l2vAVbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9C/D2U8IqTdoERi418WlnmoQj++kfnL0tdUxoos6hYQJABPLyV77H3/UsH3hMpDmbtM41HXrVEUPqYT5hXBh2SOfVO55gyBpChWGbwi1PLXjpHcbssich4YLhW8f+gGDO6cYyRg0jRl1fy7Q2PVD+TuBLVuK74rg5/0yjwO6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/meQSg5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/meQSg5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so1845505e9.1;
        Tue, 10 Jun 2025 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586365; x=1750191165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=l/meQSg50mPsiK//rTYF/6rXkAaLor/1Lg3qLOlu9lCNPRujX8DaxOKlDZICIYts8b
         UQtvgraBG7Kd+YM5eecmASqfLHgiu4KWpsBYRXJMyf6JYfk1ZQ4q+Bx782S1CS+NaBzi
         5VnSigGcyJ0DPBdQmVDsZyms4HmYXFsBfkrYo5vlFlg4omMH9HsThL5QDTK93R55Pf0E
         1OkbxDdhwuu7BseBrMMTxL2sG6GreLwxxfQd2yyOGxRUrDrDRiODfx5Qr63dqu1Ptx5B
         mEtygphuDNT79Dtq3QUC2mBWhiA9tFJL+iUmrhVQIEzS8yQLmsq3MNl9N97PdyfDfqPL
         bXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586365; x=1750191165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=ULQKO66kn0e/TvcNovk32ZHK51VkzLnGekc+1YQ+gr6wGxxn5R9bWCKzHEkAO8jrYe
         +qx+Ve2pKftiqte+NwxTM3xSnGz1N11c4nEReuRnJM9adf5xi7JL+8IgSQx4MxIC2x6Z
         WZzk4mGdPlmqg9rmOBexjz2ner1WT8kAlz1T9JQ2iEKiGoUTcfqHc+b+jQ+y6v8Qo+Iw
         5f+he9F8o/p4fUQeKh65el6kM9xd14rvXkyH6FngRwcyC2+nBKosWZs98EK0QFd7C/xh
         jLHWqCuwYUB21Kacqrk4hbqo3YewjWydCxs15VoPTTXrdzbfWwBgwRsWKAJLIXbWabCY
         h6qg==
X-Forwarded-Encrypted: i=1; AJvYcCUF6B8EOz9ehlXQ4NjnuEkaMFGhojQHqCjlqwZiVZ8y438NU7rWtYiYc105+qQxoMxT9p8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqZfuxs6T+QwgqPW4ms4QVGXkwOuVxsKEe4/o9upBxzkLhPH72
	ntMZFC3Fohe9XMCpA7/pvGW6yCIoA4oN97sSKUoef1626DVYJgVdCPQeXQTNLWOdVH8=
X-Gm-Gg: ASbGncvwuDz+uWqjOa+VyBRdCMOx3Njom1Cu5aLDQEZSQ7Yz3WancGUFhl+n4Xnw/0M
	2ikWiGckA0nIDa20dJBm89CbRLGalJCqvmD2ppK6G7VzrliiHVQfntDkrSagw8DlSu1NCV8PYDy
	kkg3D0I/ucRma5q44NMLjunlpTF0DDpIgIGtMEe/QxwEmConfli6mEBN3fZZCMO+PCa4ih+hHRV
	RSho279PKFL1lJAjEfUet43YRONH2HEVqj5GqThDWcXvd1nVkJSp16wAOOeod6rpEP6u+PpJkPr
	1FzPgZ81jyfLLrpCERy5q/gAT+EMz95CXCgo7imVlkwchyxKWxXIpK4jriVp1RLI+Lr709wgtok
	=
X-Google-Smtp-Source: AGHT+IHineQrgugs25LCya85uBq6rIjv937s6Fj4YMPKEhIETsihHbGjyPMBhZchKD/YHDl/HXkiFw==
X-Received: by 2002:a05:600c:314c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-453240b0e39mr7125885e9.3.1749586364752;
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 22:12:17 +0200
Message-ID: <20250610201241.730983-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.49.0

