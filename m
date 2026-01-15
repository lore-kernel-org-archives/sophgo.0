Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63752F28E3
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504701; cv=none; b=RwqqZl0OEJ01OqsLtrazqv8Z+PNrE0rjPMkCztTaHhWLPudA4kwVjNhWpSD3NZMF+eF2r+Zsxx3LRTaIsP04y/d1Mby7z6OrEIkg83emkdScUPyZF4/aO6kUaHZAGdfvSqywPsc8MzG2x4DiahCX9Hd7TbqGctUbCl8i1PqEpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504701; c=relaxed/simple;
	bh=DQtXugkjv8oX6MRmxxnR9guqKGpU+4+ND0DSGzuSelE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1x7yKZf8NZgHKyDQe3e6l1l3TykKYWLUaVD/tloicxOIC7UjLbqsJu/F2Q0kIaEDnd7e12ap2djlxmMX/yBctVU8FHdD8mzDYcSArrELPvdosa87L9cvAkSmhqpxlhSj2HP0w5BDRxsBphZUzXuD+R3cfJ53QOqO6Lv4SpsdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNXzLK6k; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNXzLK6k"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so1021647f8f.1
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504697; x=1769109497; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=GNXzLK6k6IU35R+voQFN40h1g/2+0QX0/TYnOQyeVTJJufp8CA0QaVBTmbeu8M7fz3
         EcPXPRnJqczZooM2Q+LdeG3eMRvPWfbwiNOqZ+yxUN6A8N7E24ZVUF+yk5H2Vdp1FaAH
         OQaZlwdFxQ/8yFa4u5+yfCa9kfh8ye6LeVzF5QCpxEi+DuXOgRWvFkH5i+OzMiOMaQkN
         /6HwbueIg14KeP7PY/xerkOc/cQfbLty11htYH8m69ox/k/x2Wr4vnpQ9MRda0zlPhfv
         SDhEGVRaccKaNXVPBT796PvHEx+57D6hPe/iM6FVhZEGMXUkHtOak9jj/GGq3kYiwEZD
         KmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504697; x=1769109497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=W8/qKf9XF6lBUve/F1pQVDhqZAK6p65LfIrN/KPSENNNsBXLV8kcKTNY4ydjX2Btg/
         7jcPsiNqvCjObI1DpVt+RYXhB4xSN48VlYROASOsD7IHki31gXhrcP+y0iQN1LX7sfnN
         kg+px5fy1IJPqCMFzBJwYs5cBa7/YqUDHxs8JaMvJUxo850pGxrpa8Iuj799lVzbDuzH
         bpO1tH+FjwH0WfXjxH2qadIYiSRZ49+XiCZyNxa2FSh1dF+Wl3o40xNJxbzklF7aYkIH
         Q6ewUHrGq7rIVg6tCIAQKftTXFVsEkSTy8xqw6a4c8ZRW86d2qgSlZus2VHwV8y3rfCL
         YkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlRsEXsIvU6RQYP+NLeltJzZb3ItmX3qQAntdJpUj4S8FGWWUKab8hLGV7mx2HQbIbehTgebY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvFIpMUgyhgg3Vr8mbVwzNDIJSEU+YlG8rLUGkytCZrQONey3J
	mnntMppp5yMhQpY0roR0Jwn+tJc5Ps4+QxHR/RiG0oYtS8mlaPJa0twY
X-Gm-Gg: AY/fxX4IHel6qQpb+8B6kwjDq858qk8Zkcb6ce1OcUhUFPsW7hhWbq7KqR691v3z4AG
	L7bh2+6Wka8fZWkHocVj+zFNLr8g6qkSd6/wPnUvG7sj2fxNFfiRyrLJbTX/XsT60y46KBovd+d
	CD12gpJY+0csZ9gkFnn36BgLD165z8DnIXfDvaxwAEORrPwMY0RAT9HUrqSXVFvc53Jxp56TCWu
	46js3XpGlWfuIG2gOwoMneerDa70rTg7wPohhmHeXG2VY692IRYKm37bN8vxdrtBqYaUEc5iArG
	1p7Zt+nRtsa6Yrh67OchNSazYx9JUAA+SBXP3VYg1EjPiB/DG6Z5E2nfysN5GbD/pczcjVEkRkh
	zxnRaS4CrrDB9lgz2/3f1ZaQ21uyIsJ9AWQXxyoHHpBqnD4eR1EoJ32VWdZgjPMUUodh3KBs51c
	Hp+RPZboBfafpnWIXwDlJsblsTwL7ifxk7Pv7a5jss4BYO
X-Received: by 2002:a05:6000:310d:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-4356a082e2dmr403974f8f.48.1768504696733;
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:42 +0400
Subject: [PATCH 5/8] dt-bindings: sound: sophgo: add CV1800B internal DAC
 codec
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-5-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1672;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=DQtXugkjv8oX6MRmxxnR9guqKGpU+4+ND0DSGzuSelE=;
 b=yM+zC4fx7IIosib9wWNkVnBDpFynlEiv6ynEXZvFjIYVeO78hrI1gJgz8ZSXSXR1lUTlJNP4a
 qleFH+mRy5KCKhR5BVRssDGDyFSa0R4d9EPyWyCc2OxMY1+wN1/pcIG
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.

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

