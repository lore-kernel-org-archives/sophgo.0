Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9F3BB130
	for <sophgo@lists.linux.dev>; Sat, 10 Oct 2026 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622719; cv=none; b=I0VwGOVY6/5qVlHKDnRpSFyEnVhsc73K3GUr+515lrVGQiLkPbg6TOSldpmklKFbD6UuwM7oHXtM1ORslfB2k7R26l9atynDvkssriVg6LHPpMoAxSXv4tzG8dJ0wH2Eyr0z4CPbNoKirwi/pUeiCNqqjKkkCqx7qQrL706ULPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622719; c=relaxed/simple;
	bh=W97+P1sI+wVSHvjZGqgM3hRTxCZAypDzv59Q/KyifIQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=DhB5dieFeX3BBijw+Cra1eKiq+AUGULWADGh022HbGHvtuq4mQAMNUcbyNB0/ND6x6vyX8p0CzgX52NTF75R3le+dOTYhFjhVPEbldiU7c4h32YHS5PylGFL33Zmi9PZ6z6LqLgiMvtMFE8r05/gQy4biM6Hr3lBmsyUMhI+dzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mvBzs7as; arc=none smtp.client-ip=95.215.58.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mvBzs7as"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=W97+P1sI+wVSHvjZGqgM3hRTxCZAypDzv59Q/KyifIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791622715; v=1; x=1792227515;
 b=mvBzs7askcm+d+opNUMt64GM7QVlbq+JWmj9qRKIKg6kZ/kvjcrg4C0nd5gmmJPL0ZWQRWBj
 2pnSmAn6h8sDYmVtechp2fbf5puIxpCyDozg5rhpUhNAexp9Ni2OBUbaw9lhpBtyr03JnjlcKd8
 x+/D3JWAgI5H9pKMXnsblkaY=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5c8771d9512265de;
	Sat, 10 Oct 2026 08:58:35 +0000
X-Mizu-Trace-ID: 5c8771d9512265de
X-Migadu-Flow: FLOW_OUT
Message-ID: <d0107403-7278-45e7-845e-0c054c1c144b@linux.dev>
Date: Sat, 10 Oct 2026 16:58:32 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <chen.wang@linux.dev>
Subject: Linux Upstream Status updated: Oct/10/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Linux Upstream Status updated: Oct/10/2026 
@https://github.com/sophgo/linux/wiki

CV18xx:
- Do not reserve memory for coprocessor FW: v1, applied by 
sophgo/for-next, expected to be in 7.4.
- Enable ethernet for Milk-V Duo 256M: v3, applied by sophgo/for-next, 
expected to be in 7.4.

SG2042:
- Limit SG2042 SPI NOR to 12.5 MHz: v2, applied by sophgo/for-next, 
expected to be in 7.4.

SG2044:
- Enable SPI NOR on SRD3-10: v2, applied by sophgo/for-next, expected to 
be in 7.4.

Thanks,

Chen

