Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E383189528
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076274; cv=none; b=U6ktvjYjAMhLY2QA+CnYSO6o6HtrGFSi9JkK5GjnQbI1yI1Ag/VDPfvKONQpOq9xTCLVEg3bI4TEZJWbq0MjujFQp8l89Da2FObroAC4uB3lnImLXEqHWCd8dzvOtjVyChF/FxgUD9JIupdruZ3Mwb0GWVMQ+bpbmv5D+eMsYFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076274; c=relaxed/simple;
	bh=2gvZFK7B2/ygORWICSDGt1IIAH1Q/EJuv9x/GA3yxW4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=tUGjD+qApK8CAU1nFTl3cUzavP5IljTq0m7BP8fT7A6RV6J5z+brm+SfcAFKw0FUDEzJlTctxblkJWlBkArW4pO5009q0EFkxcFtxSbW+mhyX8Lm6MKBxloxlmz/Nn7NCjNwuv7IpKEmo8PcY0pjF2+R0tBwp4OR8eLUHwKj/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTgJYD5r; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTgJYD5r"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1485254b6e.3
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 00:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741076272; x=1741681072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJf71JyQpoB7ef3U1+KnZ33sVZVyCe8BDjmZzBJrNfo=;
        b=MTgJYD5r/K04lZPk8mAAsQwIQ3CZND6hhEy5tYE+WAjf9E0EGxfSVuoOgIYbeOWDSY
         hpLQiHhz5sSCGbLNM6mIVLJtyF5jcjAS9Zz4YXCgVEsgLsN8bAkeGUhgp+myQiqYgDjB
         TcEFxN32BOrXcatXsAaRWuKZv4nyjzQ/odesJDjzHRNKzihmmdnLWkgRZDKBm6Ns0xWK
         ObO5SysXPCXhpwUSnkQx5AVL+MR7otMDMJ+IZAS7C4mw1FHpya/abbTCiXUlZeIMX9F+
         +FtXUqinQMEyne5Hy9ENA+VDdrdkgL/We+PdX653kHYfnQjf3+lNV+jDEiLYK8bjuZWB
         5VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741076272; x=1741681072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJf71JyQpoB7ef3U1+KnZ33sVZVyCe8BDjmZzBJrNfo=;
        b=aF7YKyrFdWfaruD3h1him6CfV9ZuKVfIcGvfcnogZTF2WT16tVUp94hgzmqslKTLsY
         lMaXSJVy8hzwnEWX2iOxqiflitCXVf6IdaSiUHvDT+saO6AY8qkASIcdoAVDLjcY7XYI
         +QjXss28Ia8gWK22AjJaJjtQUM0oXOpAAlYy0vxgricTFx0k6IVIFfFxG9wvzE/fHldH
         AI5ZAXFeLLTOmAcGpbHETfuei5zTA+0Q2EAh4Kc8mAstLg3OV0nD9+Ungj2V2uSfoVMb
         XuR15pyQiB69jkiCggWOD8T5Gmt1XfZ9X6SEYNlG5zkZmeyPGJjmuDiw8FvuDaH1K7Rc
         FsgA==
X-Forwarded-Encrypted: i=1; AJvYcCV+y+vBuXJ21RDMoWx120ZrFDiYp6QMuHDd4uCwIWv0JQ5hgmfnjrxytv59jk78W2SUykNE8IU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzefnz4CbUtkpivKxIm5pMjvSJA6aePmSt6Z5xy0KLqCbPl7Gjv
	s8iqWCFghOiWCUJBRipOrUR1CXI5RtcDz9uO7AMU4+ln18gfweAl
X-Gm-Gg: ASbGncsMZ+JCmo2PvJQhuXjX0w5IM6fe+nDPtCLv4IraWzJmRtRgnt8cUBwJiI2xdB+
	tfhiw+9NVlg0K1qXZK1XackBWf0w20QalEJvlkoWPNhezjeBzy1fwz/qKZV+WUFyBgJRVXzRLrN
	EAqPx25NnRoPxFBA08Vy/0PQI0B+9rXPnwUqoh93w10Hwq1L0RqAEu9UjRqfCrbI791f09+BwTH
	PRX20uASFRoe1q0+ZMijk4jm/AumcRnEJF48HMy3Dut50MYBx+fjGPq7A5SNnAaT49B5iIwlcpx
	kPUQPXCbYfKhsi6JriMyw68lOD0ld/4Qvh4mHTRAoF3EIzYn9vcYHso=
X-Google-Smtp-Source: AGHT+IEzPzDeanddwsgQUTJLbFlFQskBte1JTGbzjSm17M9A3zitxeIjEZa1MG20CvbmO1rnKTczyw==
X-Received: by 2002:a05:6808:308c:b0:3f4:1912:1064 with SMTP id 5614622812f47-3f558601f19mr11817650b6e.34.1741076272226;
        Tue, 04 Mar 2025 00:17:52 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a0f80b6f5sm453009a34.38.2025.03.04.00.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:17:51 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s-vadapalli@ti.com,
	thomas.richard@bootlin.com,
	unicorn_wang@outlook.com,
	bwawrzyn@cisco.com,
	wojciech.jasko-EXT@continental-corporation.com,
	kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH] PCI: cadence: Fix NULL pointer error for ops
Date: Tue,  4 Mar 2025 16:17:42 +0800
Message-Id: <20250304081742.848985-1-unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

ops of struct cdns_pcie may be NULL, direct use
will result in a null pointer error.

Add checking of pcie->ops before using it.

Fixes: 40d957e6f9eb ("PCI: cadence: Add support to start link and verify link status")
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 2 +-
 drivers/pci/controller/cadence/pcie-cadence.c      | 4 ++--
 drivers/pci/controller/cadence/pcie-cadence.h      | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 8af95e9da7ce..9b9d7e722ead 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -452,7 +452,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(12) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 204e045aed8c..56c3d6cdd70e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -90,7 +90,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(r), desc1);
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(nbits) |
@@ -120,7 +120,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 	}
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(17) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index f5eeff834ec1..436630d18fe0 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -499,7 +499,7 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
 
 static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->start_link)
+	if (pcie->ops && pcie->ops->start_link)
 		return pcie->ops->start_link(pcie);
 
 	return 0;
@@ -507,13 +507,13 @@ static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 
 static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->stop_link)
+	if (pcie->ops && pcie->ops->stop_link)
 		pcie->ops->stop_link(pcie);
 }
 
 static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->link_up)
+	if (pcie->ops && pcie->ops->link_up)
 		return pcie->ops->link_up(pcie);
 
 	return true;

base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.34.1

