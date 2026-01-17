Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799422E62B7
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681185; cv=none; b=DqaUXASbT/W7qKngtzHuADBy+55LOlBy+7lR6SoyYoq41dtXOQkOq2kRncl91HBXw9LhA8pE2S2ATx8PkzIaibDpA9OoJmNHlv77e7/HDi0kbE+2b3EyZ/0BcolkHmGBc+aMHmQVTTAt5f8y40nhj57R63kDkHmwBm+fnN1LnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681185; c=relaxed/simple;
	bh=GwTIVlGCDzAackWj5fM/XVH5Lb9iGR97dcSVgftL+2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd0BJ7l0SnXOfRu9h9RRrJDnFs8OxcZMlR7BFZjm7ePGN9B2k/Zj//PWkxL9KFD6a8Ak8nSUIE+ujZCONQCGoKYv0y4DXvUxKSL0YmyTLKY87y2yReyF2QZ/tTSYFOCOJOI5r+DZR2tBQSx1BbAHn65SleadAObVgyx9nDWq+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/Xg4GsX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/Xg4GsX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so19665855e9.1
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681180; x=1769285980; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=K/Xg4GsXxuH1UCUrMj9UK5921wGl1loh76n83AXqXygpcq9/dxOr28X2+tNs/dF+LO
         gI5LB66rtIabQ73AFluSK4eiJoKux5tGrscera037oxVz8KkxdMyp1eslFOUCNcLI+Wv
         E3xhJbxndICozwb9hb/0pXgkp91Hr6bsx2J3fSppclWUf+dNOX/sOq/N/OoVB14a16nE
         gbmizY4V+cXUZ4blDENFsq+sdHhp7KSh9IaC0lgz5oQ2lYsn6y3xNdpu7d/V8Fgs2thp
         geKeNanN1rMNi7BCwydDmLnjx2/SMbJ4YW1TB87UxvIjLMjlXbKLjK6xeCGe8U8Zjbbj
         ySRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681180; x=1769285980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=CyPJLQTvi/QYJQ3ssungLNSIUhpAirrpVK01Elget2cKyLiMRtyAhccxnhPxPImqs6
         ZNY0u7a0qmWoGc3cvPeI1lrkMktDKWYxumP7C6tU+8jGZVyqUh3KPkPz+rVKgcD/MTkk
         QU0eW3IpIOiN2W4V7NBVMAEBbddGep2f3No2Jbm2ACluMUvg5fGjPRMMO6Y/D8cOdSj0
         83EqLxPuQx6I1igfacxvemg7c2x8b1HXGGAazJJa+8I4nooNcYnQw2/5wLZCmYFduy3p
         le9KBsx96gnDn5E9v9p5vP0xKkvAGVojULCbho4bBoK6BK3b/oc5xmxk2FmwK5REqXOX
         KdEg==
X-Forwarded-Encrypted: i=1; AJvYcCU7nwP1n/eZzT1OJy1C496BcsJGekWmYBjr0TWW7EwIzbcTrTq0I67HtNIrCQkVh1bN1KHExgI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdnwuMxioJBlHG3tYfA7YzygiQUWc5l8nSz0orVq8k48FL9EyU
	50A+SE+JRvpPDrP7xkwEtLyj58sD3GW8STGSTuJ8z2L/551yRMNZpXVw
X-Gm-Gg: AY/fxX6m/VPW/KYR6dev8rw9/+LGLoJ05vYHI2uqUR0FYNv32CP1Mg+VeozuCnxKzJd
	C22NsFgtnE6veyJ85C38zmyKJgidUWdo7Wb5ng67q51NZTTnGik1l/WKEZKExvLZ6R5m5IyxsDw
	p2Z6Jt8qIVrhZMr9f7bZ1noUGsWF4EK0GMR+m2AzMcVyW815RDPPMMVxcC/to4Bzg/pcR5P1qoe
	pHM/7U2nD4ysZ6OdqVFt6jCxrdBB2nuGahX1MCUiBrq7032na/aANKiNyj9GfDG4g7zhkEhTWx3
	Z/SmPZVEGNmgHgk1lb4f13TQZLe9s/LmzIf+8MVGDkFYRzgylejflolCZd20wypfJj+2Psg/qh6
	clR85Bs73hU5JRoRPUSXD/QI7jMc1+jGRjONvw4CLx2n//EEQI1JFuNB1qC/cgqsB1sQ8tPZGY8
	2udl2r9exiHIg3vP4Hs/rukMXQwj4gnR91GECO745WBDx3
X-Received: by 2002:a05:600c:548d:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-4801e2a4c3bmr88691655e9.0.1768681179596;
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:57 +0400
Subject: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1737;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=GwTIVlGCDzAackWj5fM/XVH5Lb9iGR97dcSVgftL+2Q=;
 b=gWseGCnVm2/lclbG2rn3qTW1KAMRYhjwJ6KXzgLpr24RyIRTPhxiEifZ6rXedoHGg4b2rRBJg
 0zD6SVMzvkUDOAMuPw4nvoWJS0mMvRtfBHAbR4UhgEvE/VkxZzHvzq7
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.
The codec doesn't have any special configuration at the moment.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..2a35e38dc7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+    description: |
+      Register base address and size of the internal DAC codec register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0

