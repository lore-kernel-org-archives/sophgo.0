Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636931987D
	for <sophgo@lists.linux.dev>; Mon,  5 Jan 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614508; cv=none; b=bJCmWymrMSP1xTQmKyHxKCh7016PPbS5BwrNIY3oGY5YPXUUA9f4wJuOCdIk75AkQVXP/6w5aEoN2sYafqnnZavpJIEw7twL9Nu+r8eT0fQwKL0zNjQZilNMA4wxoolihmSf4p9YUIJHdbfeqV8Nhdi/83YPeJI/FeMt8A5b/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614508; c=relaxed/simple;
	bh=s4Zp1PExfCSkpt+X/Q/fCkCFvRLv6N0SrZZTA/2PWFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWUFbkyWod9DFudJ1Y+2gCDcRMfR/H4KN5fcv+SaMbXW81scSwM+MLn9iaMxTQn9t0q2feNtMkoSTJhgtzOup9fNXrAeaXppTWYPwxmCJZ23+ktoTnrkivRqTzTK4KOFxXYs9JknwpNKocR0m7Zohx2r+JhVKoP9D67XVeZ9tZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=OZO9QtWS; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="OZO9QtWS"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dlCZR6LLGz3wnD;
	Mon, 05 Jan 2026 07:01:35 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767614498; bh=s4Zp1PExfCSkpt+X/Q/fCkCFvRLv6N0SrZZTA/2PWFA=;
	h=From:To:Cc:Subject:Date;
	b=OZO9QtWSBOdy/UhtNriG2i4U/Jf7SGDZ2VlBPKxX5eYEd/1VsKU3w/mu+a6QoCD+x
	 BeoYcH+kv1M5akdKJiBrdiMWMHSFuK5ejv0jItGmhns8M16NFNxfTE6wakCWIJjg2h
	 g/Osjg2TkM6csiB7INBFHW+kpLLZniTL798O7tUQ=
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
Subject: [PATCH 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Mon,  5 Jan 2026 07:01:28 -0500
Message-ID: <20260105120129.58895-1-michael@orlitzky.com>
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

AFAIK this is the only hardware support remaining to be upstreamed.

Link: https://github.com/sophgo/linux/wiki#sg2042

Michael Orlitzky (1):
  riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.52.0

