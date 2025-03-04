Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340D18CBF2
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072400; cv=none; b=ba9IOJ7JjkqDLgzt2n8Z3yLX14KdIYpgFk7C9TtBzVYJrF43B5lGthCBId8+EvIEWqbieD3VRMnPDG3UGa2iKnhTn4jxK8VP9JxvKazPzrJo+B5LQ1W81Tm3RLINvZF+GdEZsbv+ZsHXJQTjYHD+OOOX17GJ214vQC+GxDZxgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072400; c=relaxed/simple;
	bh=gpr/gu0uMIzZiWGXCBHbF3MX1vSus63CKXmYmCWxdq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Al8jgIrhKaU/mdSMQ1o0UaeBjd6TiqVEqfcAWlUJ5N+YG4WusMXrwQmhsZ0b551nr3m7qeCYmMbZvdHkautgr6Pw9RtpaSJe6G/yoL/ChyfT2rkHoG3pb0o2UK/wMwzWno1jJQxY4AxLKbeZteNEhgbWHYAWLNbNYSXMblfnSSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4T8wwNN; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4T8wwNN"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e41e17645dso52957686d6.2
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 23:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741072397; x=1741677197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04t/KBfFwVvzecOXRhML0Qn2Gh7Rc4imVCzpNOWwyWQ=;
        b=b4T8wwNNrVCRXhGsdtNcyQaXxj7RvlHnMXIT9+dOEKUuuMAgcibxk52PiaYLQj7TtS
         f5Wpm318EhB6agXqkJJLpEsDahpSUgfvNvraITAFstAfr/ZDp54ObFyL5pivTQgF7rPA
         gnA3izpCH9LxIIyAgJrRRs+CUEszd70/oYAFIGuSrTon06LyKcLtQjNe0mofMwZJ2TTI
         /HURvlhvgeJx9MVF+b917N5TEaFsZGfD+rqZczYAyoJlihk/iImdA0jvjvKuW/ZlSBA9
         uac9nFEg8doHNyN+mXLxg08X5Rpj/lTGOC80g4Q0f2TrC7FP7higLXYJZP/0MVCNPWso
         KK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741072397; x=1741677197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04t/KBfFwVvzecOXRhML0Qn2Gh7Rc4imVCzpNOWwyWQ=;
        b=wVfnaH/MaKTfKKhxiMF7jYUe7dNVMq/p7qR05jPRZw3mAx/IRsq6ZPaVk0Up6np64d
         nN71bWqibzBr5B7TpV2tzk3QoZ0MM5er7SpuSKFpK2Msv/X7KVriZIsQaUZjjKzlOFIl
         xQDR4Hn3xDUsEpqLhz2TaakK+/XKLggFfTyZK+prloM1waOrWXZupSFiOXGQmFfcDSII
         GRRFSPqeZLcsWMMWyAae5n8biEYaj4Yvkj4VRLXkXQ+trXjVjBYqSCvNievft1r2tBWS
         bi0BOGgz4SjCeV/iwfRkSNbvBkL5ePv8DyBo9JKFrDvQDxLWW85MRR+fQffbr9SKWNfe
         E7FA==
X-Forwarded-Encrypted: i=1; AJvYcCWrj06HWEVRtXuiWGRTUNfCRA1WYnoei9f9obxmUuavYLz1DzbX0euvPGcqpUi859eW8okIUhw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZhunIYxETurA7rEFVrw7iVRQ4gZPLFH346rlQ+C7lJHV+OEvL
	1OErlhyiINNuekzZ+Ka0dnJ0EZ+g6lTMfKcnNb8hLVNQEZpaBmgx
X-Gm-Gg: ASbGncuQuBQx6sCMTkXu2I0vQ3x9XV5NPz9f+u90XRQXPAlHsWLGS12n3eDk+ADhZ10
	8IplTL7wDY1u6NqhRFzcz+Ij8z9voy5Gyab4XIO6Ste/opJILwJHYXD1oFRpXLP9qklTF+b0s8u
	n8zXZrAoQAb3OP0zh7OSLf2yto5pf4x5GNgK65H44gZjOyHf3EC77X9p1o6EvO4FezN+ECLPHho
	wabhI0NkMXT+QPQjlbnuosI9+SRyEFu/zjGDqAU3G8yGqCM0cputJW0hL+V41IQFxA6PDsngpTy
	hH7ovQptqsj/b/rEyi9U
X-Google-Smtp-Source: AGHT+IEKObI0ybp4bSeJ6S2BRkKmZEZlFbaJV85NGpcqaQnfX+y+IKf1GVvL/+XToao/2dp4HCiEoQ==
X-Received: by 2002:a05:6214:2b0b:b0:6e6:5bec:13a0 with SMTP id 6a1803df08f44-6e8a0c9f140mr258457966d6.10.1741072397382;
        Mon, 03 Mar 2025 23:13:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474691a1f2csm69783811cf.13.2025.03.03.23.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:13:17 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Tue,  4 Mar 2025 15:12:36 +0800
Message-ID: <20250304071239.352486-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
to implement RC mode.

For legacy interrupt, the PCIe controller on SG2044 implement
its own legacy interrupt controller. For MSI/MSI-X, it use an
external interrupt controller to handle.

The external MSI interrupt controller patch can be found on [1].
As SG2044 needs a mirror change to support the way to send MSI
message and different irq number.

[1] https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com

Changed from v1:
- https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.comq
1. patch 1: remove dma-coherent property
2. patch 2: remove unused reset
3. patch 2: fix Kconfig menu title and reorder the entry
4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
5. patch 2: rename the irq handle function to match the irq_chip name

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 270 ++++++++++++++++++
 4 files changed, 403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.48.1

