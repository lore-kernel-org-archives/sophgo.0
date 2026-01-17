Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A82E6CD8
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681178; cv=none; b=YD6bzHvs0wy1XP0Hx94NMhxM4PbQ1KLlW8DcG6oMNFU7usw8+I8eGdw9Zh/i/HtNegd6Wp0a2e8TTorQdhOM8MP+VGqXUQVfTrX3BDPNZgbjnCS1YDT83cl7VIUk9jUlP4Da6KM0AYtWbw6Y/0ArL/atrI1Jx7vUDZehvU6KTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681178; c=relaxed/simple;
	bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ge+ZXqd4XBt5jV8JDTXwzyIJ7pgUam4sFA87s862zQ0L0breLapsH6cYzJ/T/IAPyFa2bnQxRLxO3PEGbuexhZs32oVpy87EAILSQmTd49FTQcr6knAS/MDKt0w23I2lOWBXnACCbMqFgd+q3sX1yFcR0+/6m+1bPWvPpiuD2hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3/ksDMQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3/ksDMQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso20119135e9.2
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681173; x=1769285973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=A3/ksDMQXehSHkxOKJEBCjuWwc+8q4BKSCjNgXuMvRUbrbnJjyl9t2cKB2jiT6CXSY
         bq82/nRd7238dILi4fh0I76NlGGKBEnYOos3ojB+2F71S5efV8DY1XVVzk2P2iHllUrO
         KM6D+1K5j1ZffcPkKZA0+2+gJ8Uw4cEaRQgNblOJNlkRkO5GOb2GlfqDTUXmTFPShhoL
         0VutbLLg4P/YnoH61IRb1uxPw/o4TZaclYURJi8fFJfyiVDBDYESITZgpSmPR/z9fnTp
         RS0GhlQ0N38OIItOGxp3mIqmRH6QBnSUwVnHzr1Q2eS8Kc7WZ6GFuE+NabD3xhZF4QDT
         nzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681173; x=1769285973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=jUefUfOsxQvMcILDcWqEQQBPv6pIKs0KQPCeTbZM+Y6Qf55Bb1p+SJQuc3scFir+EI
         sXqeZK1HA3AdnxDYyUn1ngH4+B+SzOyC40JZMH5zj72qDGXJzDBVmr5kBk66pzFOGoOL
         ozIljTojBl43Gb1BQf+xnhR5YfyYe5WIjyCrbSGz+YtGgR6J6Bpxz/Sc55y853TXvK2S
         Koby9+GMOzyxQzRrAGs1ifHHfYVaNcTMKPVqZ0HFr+33K8gG4bIh/wSvBhEHrihpaOBc
         eB+8aqBy96s8f1/ytZpjqh+EFUjO89PbpJverg0AXyjFe0meypgQUFmBtpdZz/z6njGX
         GCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqqxWsKoWeNF1vjJdb8GD+IypZ4vjAGHoOPP4gls2/mE0oBQ3m4FlYrpMzS8nhXojgiw6nsws=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkxXHH5Pi04RiRQsvEeEXW5l53DYrrJOwgXtjlCRRbZBRio/Dx
	Bx7yI7NE63/5J1t19RiGYK/MhgOWhoF9G6jwrMlqIEJeVPeCdYAgxA3u
X-Gm-Gg: AY/fxX6iSE8CErN+3mFzrEvdJ0YeVbVlv0b75FBd/wcfumuvhQJxLmiyrxI2t5rgBYA
	rGVLATsYng6lyC41mkeV/26jzMtExAQGQroYqFH7YKiyTTtqe/eUO2rmFTr3m0cEE5fydDE6Ily
	yrgVVq/ydqbHKi8AhPbtR+wHIYcWGJwQmOnmm6o7gbdhCZ1lJBnJtt0qlXEdXZZPD+AUAPTNLW7
	/1Pth5xC/0NRnMpnORkWZF8xBb7frEE2FpZPhhYeYaTD75fcvx2uM2zdEx80Ro6Nb71kmS/n7iE
	Pj1i4cFPx9QYC7+AP8FT+zQ/iOseETFJjC8gli5t+WqUP5G6MPZNtAFQG8mEOESKGhbUsn6obC+
	vVBtNWfwhBYZnbH4yAgM3g5freAVh3EvV4fkMMWE7AoQJa0M77QJmqHRm6miPTz1qdIyObdzkxQ
	0zIa6xKrVujfef72m+8Mn05O5zfk2debMa8ATMxNiYh2FRZUQyM8qVZTA=
X-Received: by 2002:a05:600c:4693:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-4801e2fe194mr88194305e9.7.1768681173087;
        Sat, 17 Jan 2026 12:19:33 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:32 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:55 +0400
Subject: [PATCH v2 3/7] dt-bindings: sound: sophgo: add CV1800B internal
 ADC codec
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=EeFcn+GCVjQQk9AlKztuSLRvUBU20OcxJTOUV5Zv62e8woM+6/UmsJtbuI2XJHrjfsIZYIG4g
 pEFujRYgLMPBsgyOGXn6+QLsWcx6nO8e2+oHmZSTG4XSGcGekrlC1RN
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..339b60e317e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the ADC register block.
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
+    audio-codec@300a100 {
+      compatible = "sophgo,cv1800b-sound-adc";
+      reg = <0x0300a100 0x100>;
+      #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

