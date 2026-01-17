Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E772E7F1E
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681177; cv=none; b=onktP7K5ycHhbJRTCGWiMTX8EzycG4JAStwrQlXjj82tygTJ9Yn5p4e0qMDonp6LBBS4TbagOnqtS9uPhdCryeQpZfS++zyc+Kp7Zk5OBkaUvWh/QGFtPmyB+Rak6+9ugv+zUQ3ukdTBiEV5D6I7fJm61W7eIUwvzUXjTqojByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681177; c=relaxed/simple;
	bh=xkpcY06T5wFRQA45eU8MgJ1mdP3AEvbYjLzx5NAKsb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiAN+uRu0bJ+gap5/7KGvRPF64bZr5E8iujh0ierM6gjZKYxsfxCeXXztBnbK4jdfDwg7h+/im0H1A1t8A1RgA4dEq7AoZvWHf5fxLf9cUFrFcYTuX9zUzWU1Vb/P2U3EmaNGthIbGSMNO7ekK40O4hed+OMTX8DXMS9rI6115Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVajtZdz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVajtZdz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1736757f8f.3
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681167; x=1769285967; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=KVajtZdzYXAytaiHmMwPsOgpKaMZ3fJvZxg/pZiZpXVCBXb7lBHiplfng9hqGReQNg
         f0tHGBXHjoDdPyppPoo8i0wdD5a2MEF/vy8OKRiiGzeCfqnAVyCso6kU12QO6jS6I3zA
         j2mo1sLlW+uBwSPclKQAPUYZ8GmvG9+eeCo9SEF9N6QSeQnsTJcIGG77qdsbtbUhoBb7
         7L1nF+cMylCy/1EtO2Sz6yexQkzof02g/zCJhEN5gNZyTPT9DDswc0oOyckSFatXWqqm
         pOcD3x1HQS2BAYaK7j+O5SqnzUKlywpFHjku1kgUot/oOYuy01FeQ94HWbWyNbn2Ur06
         x2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681167; x=1769285967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=gbhnZ1Fl+GVo5ZsqVlUXVueq3+/5ZWGFImXDuefwSaQUn0118aORzZgv/IM5ZTHW+l
         bx7I/aJCup0+A8nJDqptKPsYGKYlfNGhg5f+purgpo1GzdCs5Qqz7xL7Krb2YJk8kGCm
         wwrTU85WQMggs5bI1/O/A6MuPG1qGiSzAXvnPGMa5JZqw6Inhf1mxlmu+1PSeWL5tE8N
         8b4f/whruFD+LAmlpYMNWMx1yQmee9hepHY9dmPOOYTN4pORB0Prz6N9Bptx1NzvqWWF
         knCp6q/MRXscCJ05hc/955j1mymJg1qJvj3UJe9mpZkNoLK1+O8eZZ1pocdMIt2JhsHz
         DmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+HJnXUe0J7aDIf6BkdwFZXvEL3/2F6axDwYustjQu2mU8bctDSHn0hWfGaQ/3Fba9SHL8IzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu+2utXe9heJLUkR+42jtreFAfUn606vvixsYFpyT0XE9WMEE+
	TzNRTu/sS58uQyLjIliVlas2UoYJ7cM03EgxWr/zb3+EBT27g5ekohde
X-Gm-Gg: AY/fxX7HYaQGxkGflicuVBDPAsImuU7vC4DGIghjB/oQkjDFGLrqNizw5tN0WEwqqJX
	EkhydLTfQzAtqBer6LfRFdduIkOg4EsnUpVNYEBJRyC0wcbJjedC/EX1GAroFED7A9GxaQxsGJe
	tRetzwibSLQWdnLQFwN7bu0i6Jp6ZOYDI2x++y9MIifkXirQ3G9EHXG/DwGZiD3UvW0F4p5+cZd
	yI5Kv1NSyP5bJVzE5L+1Ao2IFzFwmMA7TVlV68RB/F+4B/WMkYxKbYsoV+0k/dKtIzktbQfPh7Q
	YCnlUy5teTq5dAS/stMu/bokmCO7DALSywBXBsWmcrPKzK4xmQqnW8xbJRi1OCN1h+hX8VsqS4J
	4Qo1q0Opd3SU0Y0wpLs9rzN1QtzUGy2+lPbW+zvHs5RQS1mf6VFtd3R7Tz7LlnK4itDfIJGqIN9
	TzlbPInyli3mmr7TEsF4TJGdKkgaaZPrSW93xHqfl1yytB
X-Received: by 2002:a05:600c:4ec7:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4801e30b6f4mr71192545e9.11.1768681166795;
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:53 +0400
Subject: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=2586;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=xkpcY06T5wFRQA45eU8MgJ1mdP3AEvbYjLzx5NAKsb4=;
 b=pC6DV7GcI29FzrC3Bw4ofC67X6yqQvXg4mNStfo506jWw3oV/KO8EwPu9xuatoEK/rpgZTG54
 zNxte7NQmWECIAwaPL6+eJ/2yQ9EfbdX8Lgg30Tihx77gEimpIQSPnn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Purpose: introduce DT schema for the CPU driver
The driver uses dma to transfer data. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..cf30880a62da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,75 @@
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
+description: |
+  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
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
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    description: |
+      Names of DMA channels. May be omitted. If present, one entry
+      selects a single direction, while two entries select RX and TX.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [rx, tx]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s1: i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+    };
+...

-- 
2.43.0

