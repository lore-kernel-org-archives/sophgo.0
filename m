Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E646AEFE
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935977; cv=none; b=gwhMrUgP3kARLRpzGHPOUscU4T9gKYvf2s5sVXaiEhDQulikfJXJ1AqsTEc+KTmXtL3VhfqsVer9gRt68KCBmlrrpROdjxiycc6dVyzwFPNv7oDOTq36hYVUsw/sFSHfRVAhwXxfY9usLnH+4WFRtXdJnZHyye6Cbbi3qyx3Zts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935977; c=relaxed/simple;
	bh=yxnEx4BU+xefwn+EfFU7iFurmvPml9i59k/P1RLAJgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FizWfXR6/klYfftz0+qNcm04yBWdYH7M9dfu48e1yaXC6MucrgxYl/lMKaCvH7KnZk+owTdu/J1vSrVOHZ2/Qk/0K2Kjx6VRxRKSSUxNuUn1D8QGsUhS+QQOVux59ZdYFiGMIeew0rdjXt5WL2lCOrn+z7FIIU4INNjQwQLD9MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAuQ82a8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAuQ82a8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801d21c411so20721665e9.3
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 11:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935973; x=1769540773; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=LAuQ82a8fNYBXLCMsPjEPbdKeQa4iZOeL8MeKeZRrNSgEZKwL7tojubPbmhxgoT8Y4
         +EnSZyNWx1RMYSbdqOGvzBy4NWWEGNEMGP9lCiKvS4dfq5neK1IG9StnBIV/C7Yg+fYL
         bFoVCO1h8p9MeS5HHsUWHwL+/6dWr6FseNQ8XDNYMqdLlUqkig9t5N074NbqFnyNExUD
         msc2cQjZ7OPfeKCMr4fxakBOla7ckc1p4gZaGe1ede46X2d3fixUksr6BM+LiJKUwD92
         sUj48UMYOd48I2SDCaeKwfLjqtWPYZgjSy2UycC5Mm/BFWUWhBg+maTgU3ZgAc88ZwUB
         PEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935973; x=1769540773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=W7ydFyrHWu3Pe1IpZZXM12r/aAo1LaJL+CC7YtXF6auXzx9VRWHkP7e1eEWP5KJPn4
         7kn9Sx1zoPw+zbpkwEes6yOOLUAHA8oTio6K/jvCDawOUUqEoEunjp03hgv2Wp1m+mbR
         FCaeWxgFqN414SHF/SuqxErAuUXDAxARY5V69QEcdX52Er0ZhNw/TbwP8C1rBdm4BCkJ
         memQes70nGg7HDR/0pZ0OGe2XfkyZck9ncea7Iq6JR+BAyel85wlnMFkguKbe91rSA1q
         B+YRxecKdAT2DhVS4eoNv26TWiGK7YpE/NTTnWHFHbATm5plWdVzPY5PIuzPigRgwF/F
         xGLg==
X-Forwarded-Encrypted: i=1; AJvYcCW1lJ7Gc5A6JImXk5TF2ax3nmbEPVPFPqAdvbPEllQBbIjSf53wsufkBwhH9S5L9txGrKsuAgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP5UgOyx4sex+KYDLUEZv5eq9QpSkGKKtFGJ8gwWmmKus8veCp
	xSzI8VkCYM0ba0/INhJIOKzG0SzTIIpp5Sfsc8XGopKbeWJwwwwSFGeE
X-Gm-Gg: AY/fxX4W0GNaRFPHDONZLKsn6d24QwSmb+w97FhQqaShB1W4acyJ7YPE5ZQbaV4hZCF
	rlAZRK/5ByppuzIOXl3FdxZ809LZRE4b1GSdsVed/gKeEbo9SSPjC3n2r19rpXQBXtZipcX6MZR
	9FodPZEVx7bUx/nIfaYKnbBcT9dGbkUgQIxrxpfQHX/DzbeNIO/750yvOsCgcmW0NFg+vjuAE9I
	brTQeo71BooCQYpeDkBplOoAv2thQ4iHfQvQg7YgNGFoMpJUW8vwYYkv2QzhneKEEmQ0+hW6kaJ
	/rvKEuhLjRpufgDkxyGXnyLOf44bj8S5EW0RMh0UonCap/G0PM3NVhsHgU+OGYQPdbomMiuB17t
	Ud/EaBmfTrk25Iitx5oznjzME3IAP8NPZMicq5HgnGzoi5GMCLv35Iua0+Q3OBBwRBjvKwjyrBD
	T+DRdqtwc+/OVLIn7XFDe+Y6SWmPMlggVMKYrMN5tsRf8Z
X-Received: by 2002:a05:600c:8b58:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-4801e345987mr230321595e9.31.1768935973027;
        Tue, 20 Jan 2026 11:06:13 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:12 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:03 +0400
Subject: [PATCH v4 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=2363;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=yxnEx4BU+xefwn+EfFU7iFurmvPml9i59k/P1RLAJgs=;
 b=4ceWN1YSmA/dnUJiaFeJ71H2kKEEf6TSCxHE16GDFpBeRQWyCoDj31tNuqPWaIX99YvDyeYG9
 RGXjBukPLo5AiTzR0C+aXc52BnXDsS/mUZse/wpVQT8d4TjzUO4zggA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

There are 4 TDM controllers on the SoC. Each controller can receive or
transmit data over DMA. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..f08362b0ca5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [rx, tx]
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

