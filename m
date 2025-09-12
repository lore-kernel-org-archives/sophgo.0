Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB31DDC2A
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644545; cv=none; b=EUbzlv4ZCVlqYt6ug2e1NkHgnIwKwhlV8ZBR8y6ALOtHoSoXGnYX+cKIUxucIyMP6pvkqEILn7PPNZ567CVQvDslbB9LrCotTOAMWUgYC5mPzGDawyAApzw4sl2Melu81py+uBpBrlSh8XYZ7Qyx0KulQch5uQYCR2tGaCtDiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644545; c=relaxed/simple;
	bh=ne/AJ08EINCLHq1YL8QOv01wvisw6A7Ct54Qvu1CzBE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FS0VKLQw4E7oBPaATvmI9Gj1MdCv0ilWQgNbUZS7BrNMe9i43iJwVEjr1ZowfxCHsOoI5E3kXBtaB23Cm2J2w2TcV1J5XVoZw1vH9sMp+wimCKi38ZddzPOeEk30iQjG2/tV1q0qgZiiz7cAi7Ed6h3cFpWj3HIVnDcPtf7RRF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5MTo7xk; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5MTo7xk"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-753103d3dafso848180a34.3
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644543; x=1758249343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=D5MTo7xkWDA9UrT9L6Ah4ihZN5RVUJYtvIcncJ5BPOoODPYvCXFDKJdd4UVzC5pyyI
         s7svfMRhalB8ASp0W1+qZcVcjLCIkek5dF1lZihDziQu3nMQkkNcGWzT6Cu4M9//FJRR
         L5rjLBZDa2wzc1UzF6sTSUjPCqEt+I7bTo5NRw70Rtvkb9gt3Ulxl7Ae22ri0Mgu1Tny
         9R021pt5IPKoZpiUkaJyrBy/tTZIJc9oxe5EVRSpgBwS5AkuKEv8KrgLfo2b7YiSigNQ
         bZaLmORVMKNF3v/FTrvOaC7CUWDKYzH8GGj7YU2wf2N+lT2kx8SEDP9GF/Grfmn7EJuz
         tpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644543; x=1758249343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=tqJJ80TERbOrq4bAC/HHlHOd4N6uMf8mT7FTNFdPVzanNDgx1S4IW4QJOuCdQD18fu
         E2T1U+F6ztTlDjIAx8MxVfIBp8kJOXOsgX5VyZ2GjoJTbK34NiMbrYiy6Gg8I4HS81uM
         st4fU6ZOM1ST7esyqAbmMTDCT0tvjGHb9etZtAyOrSzjU12akHJP3DbZpmV301SnbTfB
         JrQMnS5Nb5IGbaP4cu15iMJeMnX1+WnfYGWMVLLgeAKMfA08JBnFqkJHkvG4jsF4jH86
         4TF06SeiG2Y+mIJ8L8A8uPhyNs7lzRNjgVRLGLx0C3QAZ8b0iu/blbQJ7O6FuvSeRFuy
         nz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtHbotwunLeOHP4d17Qev1+h3H4+znOHyCqoxddTEqpLWxjTDGShmDZFwW8uo2c2DZQuM40wQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpWRv0EBNkpRDSMcVOEnyneqCaY6eNvwVnEUeH0lgE7wK8TO+/
	tXRNM/8Wo8awaer8nQ2ekqtBkq0uRYVIf7W5qfpsSmb5FRXcRmrgdssn
X-Gm-Gg: ASbGncsfSd0VuDLu83tP7T/1Gl48w22KZjwmn/inSQB0O4CfvBT9qI4BVSdfl2Oce/f
	zhPAueC9DJ9n6GVAbEhokxDglhJuYtd+6EjC9fytCVbA5+dlYoCuQP8ta2qnc9hg7cgLyfaD6wn
	EMG8j1r91yAusPI0J9QcpnCTPyCgeHNgdulBgoSOKTLOymqsdgy6ERQs0QUxQD8RQXnH195Ah6y
	WvJDMU3asBs1vVjt1V2E+VUDFJYnWqid/kemvLT28m3BeqfMxwuXE3+yddhQK56zv9XU9SklbGx
	XSWxuRkeed9FgcxwyFCOWz4VfiGhyCFaRPEdOcn+pgquBZHP85TBXzPa2hvhu9e6E5V3DVaSByu
	NWjsxGU9144j3A5ZkedE7wDQhO0d512b9
X-Google-Smtp-Source: AGHT+IHQMNFCh86X7WUtfRMJW33oGIfkq7JFshCaD1qyzjsyBvpS3iS1S6F89Dx5xJzPUg1mM6pJVA==
X-Received: by 2002:a05:6830:67d5:b0:744:f0db:a199 with SMTP id 46e09a7af769-75355abff0emr852539a34.29.1757644542764;
        Thu, 11 Sep 2025 19:35:42 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524be797e6sm739170a34.29.2025.09.11.19.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:35:41 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 1/7] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Fri, 12 Sep 2025 10:35:32 +0800
Message-Id: <2755f145755b6096247c26852b63671a6fea4dbf.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 PCIe host controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..f8b7ca57fff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description:
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pcie-host
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: cfg
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  msi-parent: true
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pcie@62000000 {
+      compatible = "sophgo,sg2042-pcie-host";
+      device_type = "pci";
+      reg = <0x62000000  0x00800000>,
+            <0x48000000  0x00001000>;
+      reg-names = "reg", "cfg";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      bus-range = <0x00 0xff>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      msi-parent = <&msi>;
+    };
-- 
2.34.1

