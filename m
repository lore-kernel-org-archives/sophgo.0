Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995D3CEB92
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428028; cv=none; b=jH/v/UNpQqjK84K9ZXeBgTjhpuKz+mPLWHLdtOMZvlBkJmKyhPTJr+It3bT385DbuJzXVpkFl/15/EJ0v2zz/rUVWbUdojY8ED59l6Fa2kUXQEcoWEiEVDy3HmCFtQFh/S/WgeFW9hGNTjUWWkByLpeWEupgI68wGJpRVStu8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428028; c=relaxed/simple;
	bh=t6F00T+NF66DDCDAj6A00mQAmJ96UzMvLaHFggsoPKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C25q2DXDuBBXpy2aMGtkXs/V2lop2dbESvdRg+aW+SP/98tNLfZvUKxmvQacfX5RRQ24r0Fs1GvT49X4rb0lhfviHiZgsjhP79unbKT9QpXUgjsh0q5HRnJk1ctLjtMaJWZD5thutdyt/FSS6c8/h+aTC0CE8MaF9Yb0uavWKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=sHxhOBPK; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="sHxhOBPK"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gVLJL44pjz40nj;
	Tue, 02 Jun 2026 15:20:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780428020; bh=t6F00T+NF66DDCDAj6A00mQAmJ96UzMvLaHFggsoPKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sHxhOBPKVz7vEYGIIPmgG8OaGlq8jxQGw/P8sIT4t2NYTA3V0UE/7pwWw/MWnFYbo
	 NWj8iUaevh0LWrokwXwcXdVvDpaUb5Q2kFlfVBqYtFcMEfu2dFlXOZyxUHpA33kGYF
	 Yqc2vwzc3VmScgFJsgjisCQ8yuHfSsGpJLlwYU2g=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id D591912C0893; Tue, 02 Jun 2026 15:20:17 -0400 (EDT)
Date: Tue, 2 Jun 2026 15:20:17 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>,
	zhengjingkun@iscas.ac.cn
Subject: Re: SG2042 SATA (DMA?) issues
Message-ID: <ah8s8eNNyZUD-E-G@mertle>
References: <ahu57vcS0oOFmCI9@mertle>
 <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle>
 <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ah0rA-c34RLkHWYt@mertle>
 <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <CAAT7Ki_=jGo1jbSBWmr-dQHT2pFovL2LAjcW0SN9F0Xm-uLkRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAT7Ki_=jGo1jbSBWmr-dQHT2pFovL2LAjcW0SN9F0Xm-uLkRg@mail.gmail.com>

On 2026-06-02 20:19:32, Han Gao wrote:
>
> case4:
> 2042pcie - asm2824 - jmb585 + kernel parameter libata.force=noncq: pass
>
> Based on the test results of the above four cases,
> the problem is suspected to lie in the JMB585 chip itself.

After a few hours of testing, I can confirm that adding
libata.force=noncq fixes the issue. Thank you!
