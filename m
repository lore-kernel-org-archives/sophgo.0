Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198524BBEC;
	Thu, 12 Jun 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734920; cv=none; b=pynNK6iXEDevSlGPS2EknEM4rS9dlKeAc1C5t1VU5x9+cQtPcBTPJLxCymkrNhDx1lecFwgSzKqhIxbbRlHh3EleDjWbHTgDJSj/mjB74o7Kl9HeOA7bmOfQx9BwImzJB++ZrwGyEA6een5jI0h27qhjbIPOHP6NLH35/PfO4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734920; c=relaxed/simple;
	bh=KPdk18C2Mmn0bNodvsmhNM54MGwCa/8PptymjW3SDLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fww6wFX8fVIuZQYYBJO6D3zeCjuqbE5KtR+zqUUB+gUf4t1RZYTYs9r2AnfwZZG7v/T6Bj5iQIHQQn9fZNJKx0rV2YxcQhoPr6cpt6N4v/4yqkRBGOk7pdVzsPkQbV14UXOFhmf4X77hB2ZYlaVx0VyZW7XdPMBSG9RwXVG05YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3EG5pJa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3EG5pJa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4533027c0ceso4519405e9.1;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734917; x=1750339717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=k3EG5pJa9n2TiCCBkwrzaSPDjnoeGxn6APTFFP7/rMDJC0ndeShTAJ6Cs0wMa7NGO/
         cTVsgvS3kGL5OJU39vY/F0rqj1UEsEyVVrp58tBxCQK28s+NI4i8sJ7yaVE2O8dzL+cA
         ovzSxEZzWCBgxbXri2cui3KhM9haWxsyaraW9T7DEoQ6x4Gw0+yapmxW0g83Uh9ukeCb
         7Dt0w5WH56AK/EhmUI6gWetS8PIajZ9EKpC07MltT8xU5VoSO6f9rhV26x8hiFk1xGeu
         r4uwh2RGvNBG8lLV5s0tY+q3pcpSutfQ92hFb4iX0ajuX8NYfsrU17MqQWplLmfJiTSf
         SmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734917; x=1750339717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=cZQLUTjvW0ImDkoVawQoo0Dhe1KUZHq85AWRl0f87tVpIeef1qEa24KlFlxv3veHzb
         5UILfWnDlW93LCNz8UUGcNeTqyajjeEt1vMLp4cx+UgH5lejhjUAsWbroZjZYwoLGvpJ
         jQGLyjPfvHZjiYNRfXfsodyZHRV0ve6SoeTWN/Rp8FORc879r0f0iWK8wLDpgdi9egcn
         8Z4q1BlDYw9hR+IzbPQusOJ7+9nJqnI2Y1Ui11XNdr3zXVZWCI3DFXSawzkg7zECFz+1
         2BweSjC9BiqHLIj8g8eOFmETOsUvFtZjyGaTrfqfTOt69MaPqCzBXjadSMY+YPUJytrE
         uCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn0nIXEm2A2Y3303husG5s+CufIUHCUeQC5hmjoymr8YGiArX61OcEsdXxnqFAvTUAqgc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYvBKwKdfe38D/zNd8GBcnfCLRoPSWIzzyKBJ8z01U9mNIwr/7
	8TI3d0AlnbXuieB5QIfIamXUxJANAfq3PltPyKUx5u/p9ecB70lBovMJSt5kGiZP3cs=
X-Gm-Gg: ASbGncux+h96EWO5zQi5ypkWlYZd6enjFfoGdCUrASLx4nNxwbGUVIM4fSoDB8ie2re
	p/gfnby5cHUaRWSl0ycjfejwvJFQ7v6kLfMWJ7DVSimSFqIPUQ+uusPQ+vBscj/OtKaCC7k0NQg
	gOxDrp1qIaLvWib1uKT0GjLFDs/7D2IJBuqZ0DVxf6475lYe65CUhaY4TdUnwDJOpDS3Ksq0+w0
	ibt3oE5jCwDVT1sAV4Ia9pXuIW8Z7a513yq7fyThmsqAkM/kG49vIu7CwEnO51UgnalBfQXfe58
	wM4l7ayk8ycWyQzAMPuIKpv4wIR8gZQw/J9F236HA77wDIWb+gnyGbxFO0rK2jfO2jwThZQpQ+k
	=
X-Google-Smtp-Source: AGHT+IEKmn4RY6c+gClx41nLsTgX4Xhg6moGyMTvcwXAQsiQquwBWP5O0+rXDnZmBQl7NLCd6MAESg==
X-Received: by 2002:a05:600c:628c:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4532b89b7cbmr36923045e9.6.1749734916493;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
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
Subject: [PATCH v8 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Thu, 12 Jun 2025 15:28:11 +0200
Message-ID: <20250612132844.767216-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..32c988f3c58f
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.49.0

