Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCF30F53B
	for <sophgo@lists.linux.dev>; Wed,  7 Jan 2026 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785392; cv=none; b=N9dVQQq8kvC0qvcD3WR4dZ0gH3rBn4KIJFgza9r+1olYGkZtwDxTuPCtsXrf+I9h/6BfvOv2yg8EBOUKu9cAIDeEGNiUb4QbuMkgeOeIUXMjg3/Y6WpfzdzpdHTgTxi0o3wVMkG//SBU3O9bFwMMyuWNueEy8zJ5wEqXTDWIK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785392; c=relaxed/simple;
	bh=wOuoDMbBMwNQWUDyFD9Ibb1QmbRGam09Jbve+PNUIig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/M2S3sDQ1qkQKUBQ8rOXSDLt3yPVRVVDPcSF/cHXGZDGHlCfSi4OGjUm/aXVZVeZUCloXKkdrNBMJeH+m2pDSj/dwZExYAVnorc2v/fkaXXS16z5HIuAElhYaK1lqLP3dsKl3EVFflEArFZStPqZsJMSvUQK7Dgf4JsPGkF/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=WTCaCBzL; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="WTCaCBzL"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dmQmj13q7z3wfb;
	Wed, 07 Jan 2026 06:29:41 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767785383; bh=wOuoDMbBMwNQWUDyFD9Ibb1QmbRGam09Jbve+PNUIig=;
	h=From:To:Cc:Subject:Date;
	b=WTCaCBzL8vLnF9WQeURYbRKbjrkCMCMK+hA208w9MyNntA8dltSfAYk3M9/9Df7Yr
	 hTQ2H5lJ//XdftYXfkwxJRqLEoySb8v9DKRujx3xw7dRiRNBdDZZtL2g7wk5Kg8MwK
	 0WezSF4ZwchPHuPh8xkvWEloyHz0j7Z2UpbaozOQ=
From: Michael Orlitzky <michael@orlitzky.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Wed,  7 Jan 2026 06:29:21 -0500
Message-ID: <20260107112922.20013-1-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the DTS entries needed for the hardware clock on the Milk-V
Pioneer. I was able to get this working with an earlier (6.1.x) vendor
kernel, but it is disabled in the upstream DTS.

Changes in v2:
  - Trim extraneous information from the commit message
  - Link to v1: https://lore.kernel.org/sophgo/20260105120129.58895-1-michael@orlitzky.com

Michael Orlitzky (1):
  riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.52.0

